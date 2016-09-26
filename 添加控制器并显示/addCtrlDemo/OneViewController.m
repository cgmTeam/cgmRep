//
//  OneViewController.m
//  addCtrlDemo
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "OneViewController.h"
#import "twoViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor yellowColor];
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 90, 90);
    btn.backgroundColor=[UIColor blackColor];
    [btn addTarget:self action:@selector(cilck) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)cilck{
    NSLog(@"xxxx");
    twoViewController *two =[twoViewController new];
    [self.navigationController pushViewController:two animated:YES];
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
