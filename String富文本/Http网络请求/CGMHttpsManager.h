//
//  CGMHttpsManager.h
//  https网络层封装
//
//  Created by admin on 16/6/26.
//  Copyright © 2016年 NavergationBar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface CGMHttpsManager : NSObject

typedef void (^returnBlock)(NSURLSessionDataTask *task,id obj,NSError *error);

+(void)getWithURL:(NSString *)url andParams:(NSDictionary *)params callBack:(returnBlock)block;

+(void)getTextHtmelWithURL:(NSString *)url andParams:(NSDictionary *)params callBack:(returnBlock)block;


+(void)postWithURL:(NSString *)url andParams:(NSDictionary *)params callBack:(returnBlock)block;


//请求不支持类型的json数据
+(void)getWithURLForData:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(returnBlock)block;

//请求不支持类型的json数据
+(void)postWithURLForData:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(returnBlock)block;

//带有中文的请求
+(void)getWithURLForUTF8:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(returnBlock)block;

//上传JSON数据
+(void)postWithURLForJsonData:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(returnBlock)block;



@end
