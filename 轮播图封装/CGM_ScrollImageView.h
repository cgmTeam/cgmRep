//
//  CGM_ScrollImageView.h
//  轮播图封装
//
//  Created by admin on 16/7/3.
//  Copyright © 2016年 package. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Myblock)(NSInteger page);

@interface CGM_ScrollImageView : UIView

@property(strong,nonatomic)NSArray<NSString *> *imageArr; //网络图片数据

@property (nonatomic,copy)NSString *BckImage; //低图数据

@property (nonatomic,assign)CGFloat times;//数据循环时间

@property (nonatomic,copy)NSString *markImage; //图片标示

@property (nonatomic,copy)Myblock pageBlock;//回调

-(void)timerStart; //启动定时器


@end
