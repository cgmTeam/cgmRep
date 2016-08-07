//
//  ViewController.m
//  slderdemo
//
//  Created by admin on 16/8/7.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "ViewController.h"
#define Kwidth     [UIScreen mainScreen].bounds.size.width
#define Kheight    [UIScreen mainScreen].bounds.size.height
#import "NSString+Helper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView *src =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, Kwidth, 60)];
    [self.view addSubview:src];
    src.backgroundColor=[UIColor blackColor];
    NSArray *arr =@[@"小米",@"代码",@"小米代码",@"代码代码",@"小米",@"代码",@"小米",@"代码",@"小米",@"代码"];
    CGFloat Zwidth;
    CGFloat Fwidth;
    for (int i = 0; i<arr.count; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.titleLabel.font =[UIFont systemFontOfSize:17];
        CGFloat f=  [NSString autoWidthWithString:arr[i] Font:17]+10;
        btn.tag=10000+i;
        Zwidth +=f;
        Fwidth =Zwidth-f;
        NSLog(@"width = %lf",f);

        NSLog(@"frame = %lf",Zwidth);
        btn.frame=CGRectMake(Fwidth, 0, f+10, 44);
        [src addSubview:btn];
    }
    src.contentSize=CGSizeMake(Zwidth, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
