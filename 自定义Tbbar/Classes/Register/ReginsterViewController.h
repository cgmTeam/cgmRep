//
//  ReginsterViewController.h
//  ManagementSystem
//
//  Created by admin on 16/7/14.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^returnBlock)(NSString *,NSString *);

@interface ReginsterViewController : UIViewController

@property (nonatomic,copy)returnBlock block;


@end
