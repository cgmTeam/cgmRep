//
//  LBAddressBookVC.m
//  11111111
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "LBAddressBookVC.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#define     jekPrompt                       @"提示"
#define     jekAddressBookMessage            @"来‘’找我吧"           //发短信 中的内容
#import "LBAddressBookVC.h"


@interface LBAddressBookVC ()
{
    
    NSInteger sectionNumber;
    NSInteger recordID;
    NSString *name;
    NSString *email;
    NSString *tel;
    NSMutableArray *addressBookTemp;
    
}
@property (nonatomic, assign)ABAddressBookRef addressBookRef;
@property NSInteger sectionNumber;
@property NSInteger recordID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *tel;
@end

@implementation LBAddressBookVC
@synthesize name,email,tel,recordID,sectionNumber,personArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录中邀请";
    personArray = [NSMutableArray array];
    UITableView *tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tabview.delegate = self;
    tabview.dataSource = self;
    [self.view addSubview:tabview];
    [self getBook];
}
#pragma mark - 获取手机中的通讯录以及解析联系人
-(NSMutableArray *)getBook
{
    
    if (personArray == nil) {
        personArray = [NSMutableArray array];
    }
    //新建一个通讯录类
    ABAddressBookRef addressBooks = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
        
    {
        addressBooks =  ABAddressBookCreateWithOptions(NULL, NULL);
        
        //获取通讯录权限
        
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBooks, ^(bool granted, CFErrorRef error){dispatch_semaphore_signal(sema);});
        
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        
        
        
    }
    
    else
        
    {
        addressBooks = ABAddressBookCreate();
        
    }
    
    //获取通讯录中的所有人
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBooks);
    
    //通讯录中人数
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBooks);
    
    //循环，获取每个人的个人信息
    for (NSInteger i = 0; i < nPeople; i++)
    {
        //新建一个addressBook model类
        LBAddressBookVC *addressBook = [[LBAddressBookVC alloc] init];
        //获取个人
        ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
        //获取个人名字
        CFTypeRef abName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        CFTypeRef abLastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        CFStringRef abFullName = ABRecordCopyCompositeName(person);
        NSString *nameString = (__bridge NSString *)abName;
        NSString *lastNameString = (__bridge NSString *)abLastName;
        
        if ((__bridge id)abFullName != nil) {
            nameString = (__bridge NSString *)abFullName;
        } else {
            if ((__bridge id)abLastName != nil)
            {
                nameString = [NSString stringWithFormat:@"%@ %@", nameString, lastNameString];
            }
        }
        addressBook.name = nameString;
        addressBook.recordID = (int)ABRecordGetRecordID(person);;
        
        ABPropertyID multiProperties[] = {
            kABPersonPhoneProperty,
            kABPersonEmailProperty
        };
        NSInteger multiPropertiesTotal = sizeof(multiProperties) / sizeof(ABPropertyID);
        for (NSInteger j = 0; j < multiPropertiesTotal; j++) {
            ABPropertyID property = multiProperties[j];
            ABMultiValueRef valuesRef = ABRecordCopyValue(person, property);
            NSInteger valuesCount = 0;
            if (valuesRef != nil) valuesCount = ABMultiValueGetCount(valuesRef);
            
            if (valuesCount == 0) {
                CFRelease(valuesRef);
                continue;
            }
            //获取电话号码和email
            for (NSInteger k = 0; k < valuesCount; k++) {
                CFTypeRef value = ABMultiValueCopyValueAtIndex(valuesRef, k);
                switch (j) {
                    case 0: {// Phone number
                        addressBook.tel = (__bridge NSString*)value;
                        break;
                    }
                    case 1: {// Email
                        addressBook.email = (__bridge NSString*)value;
                        break;
                    }
                }
                CFRelease(value);
            }
            CFRelease(valuesRef);
        }
        //将个人信息添加到数组中，循环完成后addressBookTemp中包含所有联系人的信息
        [personArray addObject:addressBook];
        
        if (abName) CFRelease(abName);
        if (abLastName) CFRelease(abLastName);
        if (abFullName) CFRelease(abFullName);
        
        NSLog(@"---%@",personArray);
    }
    
    return personArray;
}
#pragma mark - UITableView Delegate and Datasource functions
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return personArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView: (UITableView*)tableView heightForRowAtIndexPath: (NSIndexPath*) indexPath {
    return 52.5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    LBAddressBookVC *book = [personArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = book.name;
    
    cell.detailTextLabel.text = book.tel;
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LBAddressBookVC *book = [personArray objectAtIndex:indexPath.row];
    
    NSString * phoneNumber = [book.tel stringByReplacingOccurrencesOfString:@"-" withString:@""];
    [self sendSmsMessageWithPhoneNumber:phoneNumber];
}

#pragma mark - 短信
-(void)sendSmsMessageWithPhoneNumber:(NSString *)phoneNumber
{
    if([MFMessageComposeViewController canSendText])
    {
        [self displaySMSComposerSheetPhoneNumber:phoneNumber];
    }
    else
    {
        UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:jekPrompt message:@"该设备不支持发短信" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [msgbox show];
    }
}
-(void)displaySMSComposerSheetPhoneNumber:(NSString *)phoneNumber
{
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    picker.messageComposeDelegate = (id<MFMessageComposeViewControllerDelegate>)self;
    
    picker.recipients = [NSArray arrayWithObject:phoneNumber];
    
    picker.body=[NSString stringWithFormat:@"%@",jekAddressBookMessage];
    
    [self presentViewController:picker animated:YES completion:nil];
    
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {
    
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Result: SMS sending canceled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Result: SMS sent");
            break;
        case MessageComposeResultFailed:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:jekPrompt message:@"短信发送失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            
            [msgbox show];
            
        }
            break;
        default:
            NSLog(@"Result: SMS not sent");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
