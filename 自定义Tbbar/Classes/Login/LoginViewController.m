//
//  LoginViewController.m
//  ManagementSystem
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "ReginsterViewController.h"
#define Login_URL @"http://192.168.1.204:8080/demo/login"
#import "CGM_TabbarController.h"
@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accontTextfile;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextFile;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGM_TabbarController *tabbar =(CGM_TabbarController *)self.tabBarController;
    tabbar.imageview.hidden = YES;

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
   
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   
}

-(void)dealloc{
    CGM_TabbarController *tabbar =(CGM_TabbarController *)self.tabBarController;
    tabbar.imageview.hidden = NO;
}

- (IBAction)login:(id)sender {
    [CGMHttpManager postWithURLForData:Login_URL andParams:@{@"logginname":self.accontTextfile.text,@"password":self.passwordTextFile.text} competionBlcok:^(NSURLResponse *response, NSError *error, id obj) {
        
        if (error) {
            aler(@"登录失败");
            NSLog(@"error = %@",error);
        }else{
            NSLog(@"%@",obj);
        }
        
    }];
    
}

- (IBAction)returnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)regin:(id)sender {
    ReginsterViewController *regin =[[ReginsterViewController alloc] initWithNibName:@"ReginsterViewController" bundle:nil];
    regin.block=^(NSString *accont,NSString *password){
        self.accontTextfile.text = accont  ;
        self.passwordTextFile.text =  password;
    };
    
    
    [self presentViewController:regin animated:YES completion:nil];
    
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
