//
//  ViewController.m
//  addCtrlDemo
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    OneViewController *oneCtrl =[OneViewController new];
    
    [self addChildViewController:oneCtrl];
    
    oneCtrl.view.frame=CGRectMake(0, 64, 375, 300);
    [oneCtrl didMoveToParentViewController:self];
    //currentViewController=oneCtrl;
    [self.view addSubview:oneCtrl.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
