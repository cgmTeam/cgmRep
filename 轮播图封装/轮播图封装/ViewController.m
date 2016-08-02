//
//  ViewController.m
//  轮播图封装
//
//  Created by admin on 16/7/3.
//  Copyright © 2016年 package. All rights reserved.
//

#import "ViewController.h"
#import "CGM_ScrollImageView.h"
@interface ViewController ()
{
    CGM_ScrollImageView *cgmScrollview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self one];
    [self two];

}

-(void)one{
    cgmScrollview = [[CGM_ScrollImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    cgmScrollview.imageArr = [NSArray arrayWithObjects:
                              @"http://imgsrc.baidu.com/forum/pic/item/d097f603738da97772b89243b251f8198718e3ce.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=a49682b40afa513d51aa6cd60d6d554c/18055aafa40f4bfbcef4893c014f78f0f73618bc.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=012250d34510b912bfc1f6f6f3fcfcb5/4f658535e5dde7115cdc549ea5efce1b9d166157.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=56ae691222a446237ecaa56aa8237246/e3360a55b319ebc48cc965f18026cffc1e17162f.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=3290b51dd488d43ff0a991fa4d1fd2aa/541c9d16fdfaaf513d4d93d78e5494eef01f7a37.jpg",
                              nil];
    cgmScrollview.BckImage=@"1";
    cgmScrollview.times = 5;
    [cgmScrollview timerStart];
    [self.view addSubview:cgmScrollview];
    
}

-(void)two{
    cgmScrollview = [[CGM_ScrollImageView alloc] initWithFrame:CGRectMake(0, 220, [UIScreen mainScreen].bounds.size.width, 100)];
    cgmScrollview.imageArr = [NSArray arrayWithObjects:
                              @"http://imgsrc.baidu.com/forum/pic/item/d097f603738da97772b89243b251f8198718e3ce.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=a49682b40afa513d51aa6cd60d6d554c/18055aafa40f4bfbcef4893c014f78f0f73618bc.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=012250d34510b912bfc1f6f6f3fcfcb5/4f658535e5dde7115cdc549ea5efce1b9d166157.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=56ae691222a446237ecaa56aa8237246/e3360a55b319ebc48cc965f18026cffc1e17162f.jpg",
                              @"http://imgsrc.baidu.com/forum/w%3D580/sign=3290b51dd488d43ff0a991fa4d1fd2aa/541c9d16fdfaaf513d4d93d78e5494eef01f7a37.jpg",
                              nil];
    cgmScrollview.BckImage=@"1";
    cgmScrollview.times = 5;
    [cgmScrollview timerStart];
    [self.view addSubview:cgmScrollview];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
