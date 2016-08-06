//
//  LBAddressBookVC.h
//  11111111
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBAddressBookVC : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSMutableArray *personArray;

@end
