//
//  CGMHttpManager.h
//  CGMXM
//
//  Created by mac on 16/1/8.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface CGMHttpManager : NSObject


typedef void (^retrunBlock)(NSURLResponse *response,NSError *error,id obj);


+(void)getWithURL:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(retrunBlock)block;

+(void)postWithURL:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(retrunBlock)block;

//请求不支持类型的json数据
+(void)getWithURLForData:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(retrunBlock)block;

//请求不支持类型的json数据
+(void)postWithURLForData:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(retrunBlock)block;

//带有中文的请求
+(void)getWithURLForUTF8:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(retrunBlock)block;

//上传JSON数据
+(void)postWithURLForJsonData:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(retrunBlock)block;

//添加额外的请求头
+(void)getWithURLAddExtraHeader:(NSString *)url  extraHeader:(NSDictionary *)headerParmas andParams:(NSDictionary *)pamars competionBlcok:(retrunBlock)block;



@end
