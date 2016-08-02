//
//  ViewController.m
//  UUIDGetDemo
//
//  Created by admin on 16/7/30.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * uuid= [UUID getUUID];
    NSLog(@"uuid=%@",uuid);
    
    //A7E61A14-5FE9-4B14-8D6A-B394ED039C8E
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
