//
//  ViewController.m
//  申请读取用户手机联系人
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "GetUserTelNumber.h"
#import "UserTelNumber.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *userArr = [NSMutableArray new];

    userArr = [[GetUserTelNumber getUserTelNumber] mutableCopy];
    
    NSLog(@"%ld",userArr.count);
    for (UserTelNumber *user  in userArr) {
        NSLog(@"%@",user.nickName);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
