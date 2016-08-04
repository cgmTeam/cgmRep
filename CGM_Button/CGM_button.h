//
//  CGM_button.h
//  CGM_UIbutton
//
//  Created by apple on 16/8/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGM_button : UIButton

/**
 *  btn字体颜色
 *
 *  @param color btn字体颜色
 */
-(void)setColor:(UIColor *)color;

/**
 *  btn 字体大小
 *
 *  @param font btn 字体大小
 */
-(void)setFont:(CGFloat )font;

/**
 *  btn 背景颜色
 *
 *  @param backImage btn背景颜色

 */

-(void)setBackgroundImage:(NSString *)backImage;

/**
 *  btn title
 *
 *  @param title 
 */
-(void)setBtnTitle:(NSString *)title; //btn 的titlt

@end
