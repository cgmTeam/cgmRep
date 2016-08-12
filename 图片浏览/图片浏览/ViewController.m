//
//  ViewController.m
//  图片浏览
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "ViewController.h"
#define randomColor [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0f]
@interface ViewController ()<UIScrollViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ;
    
    UIScrollView *scr =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:scr];
    scr.contentSize=CGSizeMake(375*8, 667);
    scr.pagingEnabled = YES;
    for (int i = 0; i<8; i++) {
        NSString *path =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i+1] ofType:@"jpg"];
        CGSize size = [UIImage imageWithContentsOfFile:path].size;
        NSLog(@"----%lf",size.height);
        NSLog(@"---%lf",size.width);
        CGFloat bili = size.height/size.width;

        UIScrollView *scrollview =[[UIScrollView alloc] initWithFrame:CGRectMake(375*i, 100, 375, 375*bili)];
        UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 375*bili)];
       
        scrollview.delegate=self;
        // 缩小:
        scrollview.minimumZoomScale = 1.0;
        // 放大:
        scrollview.maximumZoomScale = 2.0;
        
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tap.numberOfTapsRequired=2;
        [scrollview addGestureRecognizer:tap];
        scrollview.userInteractionEnabled = YES;
        [scrollview  addSubview:imageview];
        imageview.image =[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        imageview.backgroundColor= randomColor;
        [scr addSubview:scrollview];
    }
}

-(void)tap:(UITapGestureRecognizer *)tap{
    UIScrollView *scr =(UIScrollView *)tap.view;
    CGFloat zoomScale = scr.zoomScale;
    
    if(zoomScale<=1.0f){
    [scr setZoomScale:2.0f animated:YES];
    }else{
        [scr setZoomScale:1.0f animated:YES];
    }

}

//  缩小或者放大回调该方法， 告诉系统需要缩放的图片是哪一张
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    UIImageView *imageview=scrollView.subviews.firstObject;
    return imageview; // 在scrollView上的图片可以缩放;
}

// 已经缩放会自动回调该方法:
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"已经缩放%f", scale);// scale > 1是放大， scale < 1 是缩小
    if (scale < 1.0f) { // 缩小放到中心:
        view.center = CGPointMake(scrollView.frame.size.width / 2.0, scrollView.frame.size.height / 2.0);
        //        view.center = scrollView.center;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
