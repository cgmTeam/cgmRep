//
//  ViewController.m
//  简单的图片浏览器的封装
//
//  Created by apple on 16/8/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CGM_ImageReadViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.backgroundColor =[UIColor  blackColor];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cilck) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(100, 100, 100, 100);
    
    
}

-(void)cilck{
    NSArray *arr =@[@"http://192.168.1.222:8080/XcRoleManager/app/customer/get/image?path=/upload/app/customer/photo/1470623170009FUfNqP.PNG",@"http://192.168.1.222:8080/XcRoleManager/app/customer/get/image?path=/upload/app/customer/photo/1470623170009FUfNqP.PNG",@"http://192.168.1.222:8080/XcRoleManager/app/customer/get/image?path=/upload/app/customer/photo/1470623170009FUfNqP.PNG",@"http://192.168.1.222:8080/XcRoleManager/app/customer/get/image?path=/upload/app/customer/photo/1470623170009FUfNqP.PNG",@"http://192.168.1.222:8080/XcRoleManager/app/customer/get/image?path=/upload/app/customer/photo/1470623170009FUfNqP.PNG",@"http://192.168.1.222:8080/XcRoleManager/app/customer/get/image?path=/upload/app/customer/photo/1470623170009FUfNqP.PNG"];
    
    NSMutableArray *iamgearr =[NSMutableArray arrayWithArray:arr];
    
    NSLog(@"%ld",iamgearr.count);
    
    // index  是scrcollview  contenoffset  如果不设置偏移，就为 输入0
    
    CGM_ImageReadViewController *readImageCtrl =[[CGM_ImageReadViewController alloc] initWithImageArr:iamgearr AndIndex:1];

    [self presentViewController:readImageCtrl animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
