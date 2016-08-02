//
//  ViewController.m
//  gif动图
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageCompat.h"
#import "UIImage+GIF.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView =[ UIImageView new];
    NSString *path =[[NSBundle mainBundle] pathForResource:@"refreshImage" ofType:@"gif"];
    NSData *picData =[[NSData alloc] initWithContentsOfFile:path];
    imageView.image = [UIImage sd_animatedGIFWithData:picData];
    imageView.frame = CGRectMake(0, 50, 300, 100);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
