//
//  personModel.h
//  ReadIphoeTelNumer
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface personModel : NSObject

@property (nonatomic,copy)NSData *headImageData;

@property (nonatomic,copy)NSString *nickName;
@property (nonatomic,copy)NSString *telNumber;

@property (nonatomic,copy)NSString *Email;

@end
