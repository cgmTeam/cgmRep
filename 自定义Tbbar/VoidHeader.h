//
//  VoidHeader.h
//  ManagementSystem
//
//  Created by admin on 16/7/16.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#ifndef VoidHeader_h
#define VoidHeader_h


#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define CGMLog(...) NSLog(__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define CGMLog(...)

#endif

#define KmainWidth [UIScreen mainScreen].bounds.size.width
#define KmainHeiht [UIScreen mainScreen].bounds.size.height
//获取某个视图的宽度
#define KViewWidth(a) (a).frame.size.width
//获取某个视图的高度
#define KViewHeight(a) (a).frame.size.height

#define aler(a) UIAlertView *aler =[[UIAlertView alloc]initWithTitle:@"温馨提示" message:(a) delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];  [aler show];

#define randomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

// 是否大于iOS 7系统
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)



#endif /* VoidHeader_h */
