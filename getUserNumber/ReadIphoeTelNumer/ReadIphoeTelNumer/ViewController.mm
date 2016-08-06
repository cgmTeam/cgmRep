//
//  ViewController.m
//  ReadIphoeTelNumer
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "personModel.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>

@interface ViewController ()

@property (nonatomic,strong)NSMutableArray *PersonArr;

@end

@implementation ViewController

-(NSMutableArray *)PersonArr{
    if (!_PersonArr) {
        _PersonArr=[NSMutableArray new];
    }
    return _PersonArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self getBook];
    
    for (personModel *p in self.PersonArr) {
        
        NSLog(@"%@",p.telNumber);
    }
    
    
}

#pragma mark - 获取手机中的通讯录以及解析联系人
-(NSMutableArray *)getBook
{
    //新建一个通讯录类
    ABAddressBookRef addressBooks = nil;

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
        
    {
        addressBooks =  ABAddressBookCreateWithOptions(NULL, NULL);
        
        //获取通讯录权限
        
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBooks, ^(bool granted, CFErrorRef error){dispatch_semaphore_signal(sema);});
        
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);

    }else
    {
        addressBooks = ABAddressBookCreate();
    }
    //获取通讯录中的所有人
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBooks);
    //通讯录中人数
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBooks);
    //循环，获取每个人的个人信息
    for (NSInteger i = 0; i < nPeople; i++){
        personModel *Personmodel =[[personModel alloc] init];
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
        Personmodel.nickName =nameString;
        
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
                        Personmodel.telNumber = (__bridge NSString*)value;
                        break;
                    }
                    case 1: {// Email
                        Personmodel.Email = (__bridge NSString*)value;
                        break;
                    }
                }
                CFRelease(value);
            }
            CFRelease(valuesRef);
        }
        
        NSData *imageData = (__bridge NSData*)ABPersonCopyImageData(person);
        Personmodel.headImageData = imageData;
        
        
        [self.PersonArr addObject:Personmodel];
    }

    return self.PersonArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
