//
//  KeyChainStore.h
//  UUIDGetDemo
//
//  Created by admin on 16/7/30.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject



+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;
@end
