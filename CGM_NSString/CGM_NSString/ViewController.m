//
//  ViewController.m
//  CGM_NSString
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "ViewController.h"
#import "NSString+CGM_NSString.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *tel =@"00000";
    
    if ([tel emptyOrWhitespace]) {
        NSLog(@"111");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
