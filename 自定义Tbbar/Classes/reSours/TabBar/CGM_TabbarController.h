//
//  CGM_TabbarController.h
//  ManagementSystem
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGM_TabbarController : UITabBarController

/**
 * 选中某个下标对应的tabbarItem，第一个下标值 = 0；
 */

@property (nonatomic,strong)UIImageView *imageview ;

-(void)selectButtonIndex:(NSInteger)index;

@end
