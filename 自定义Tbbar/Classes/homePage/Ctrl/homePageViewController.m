//
//  homePageViewController.m
//  ManagementSystem
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import "homePageViewController.h"
#import "LoginViewController.h"
#import "CGM_TabbarController.h"
@interface homePageViewController ()

@end

@implementation homePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor  = [ UIColor redColor];
    self.navigationItem.title=@"首页";
    CGMLog(@"1111===========");

    [self islogin];
}
- (IBAction)pushAction:(id)sender {
    
    LoginViewController *loginCtrl =[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    loginCtrl.hidesBottomBarWhenPushed  = YES;
   
    
    [self.navigationController pushViewController:loginCtrl animated:YES];
    
}

-(void)islogin{
    
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
