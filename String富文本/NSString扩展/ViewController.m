//
//  ViewController.m
//  NSString扩展
//
//  Created by admin on 16/7/17.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        [CGMHttpsManager getTextHtmelWithURL:@"http://im.mrbookclub.net/index.php?case=archive&act=list&catid=1&ver=json" andParams:nil callBack:^(NSURLSessionDataTask *task, id obj, NSError *error) {
            //NSLog(@"%@",obj);
        }];
    
    NSString    *str = @"别玩了，哥们儿";
  CGFloat f =  [NSString autoWidthWithString:str Font:13];
    NSLog(@"%lf",f);
   BOOL isEmail =  [str isNumAndword];
    if (isEmail) {
        NSLog(@"1111111");
    }
    
    CGFloat hei = [NSString autoHeightWithString:str Width:300 Font:14];
    NSLog(@"%lf",hei);
    
    //富文本demo1111
    
    
    //富文本
    NSString* string = @"现金收/刷卡收,样样精通";
    
    NSMutableAttributedString *attrString =
    [[NSMutableAttributedString alloc] initWithString:string];
    
    [attrString addAttribute:NSForegroundColorAttributeName
                       value:[UIColor redColor]
                       range:NSMakeRange(0, 2)];
    
    [attrString addAttribute:NSFontAttributeName
                       value:[UIFont systemFontOfSize:14]
                       range:NSMakeRange(4, 2)];
    

    
   NSAttributedString *ss =  [NSString makeDeleteLine:str];
    UILabel *label =[[UILabel alloc] init];
    label.attributedText =attrString;
    label.frame=CGRectMake(100, 100, 200, 40);
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
