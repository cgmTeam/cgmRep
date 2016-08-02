//
//  ReginsterViewController.m
//  ManagementSystem
//
//  Created by admin on 16/7/14.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import "ReginsterViewController.h"
#define Register_URL @"http://192.168.1.204:8080/demo/register"

@interface ReginsterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accontTextfile;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfile;

@property (weak, nonatomic) IBOutlet UITextField *spasswordtextfile;

@property (weak, nonatomic) IBOutlet UITextField *nameTextFile;

@property (weak, nonatomic) IBOutlet UITextField *ageTextfile;

@property (weak, nonatomic) IBOutlet UITextField *sexTextfile;

@property (weak, nonatomic) IBOutlet UITextField *addssTextfile;


@end

@implementation ReginsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//返回
- (IBAction)returnAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//注册
- (IBAction)enterAction:(id)sender {
    
    [CGMHttpManager postWithURLForData:Register_URL andParams:@{@"name":self.nameTextFile.text,@"sex":self.sexTextfile.text,@"age":self.ageTextfile.text,@"logginname":self.accontTextfile.text,@"password":self.passwordTextfile.text,@"address":self.addssTextfile.text} competionBlcok:^(NSURLResponse *response, NSError *error, id obj) {
        if (error) {
            aler(@"注册失败");
            NSLog(@"%@",error);
        }else {
            self.block(self.accontTextfile.text,self.passwordTextfile.text);
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"%@",obj);
        }

    }];
    
    
//    
//    [CGMHttpManager postWithURL:Register_URL andParams:@{@"name":@"小明",@"sex":@"男",@"age":@"15",@"logginname":self.accontTextfile.text,@"password":self.passwordTextfile.text} competionBlcok:^(NSURLResponse *response, NSError *error, id obj) {
//        if (error) {
//            aler(@"注册失败");
//            NSLog(@"%@",error);
//        }else {
//            NSLog(@"%@",obj);
//        }
//        
//    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
