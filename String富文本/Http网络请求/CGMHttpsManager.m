//
//  CGMHttpsManager.m
//  https网络层封装
//
//  Created by admin on 16/6/26.
//  Copyright © 2016年 NavergationBar. All rights reserved.
//

#import "CGMHttpsManager.h"

@implementation CGMHttpsManager

+(void)getWithURL:(NSString *)url andParams:(NSDictionary *)params callBack:(returnBlock)block{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
  // manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(task,responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,nil,error);
    }];
}

//          text/html  格式
+(void)getTextHtmelWithURL:(NSString *)url andParams:(NSDictionary *)params callBack:(returnBlock)block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//json类型
    
     manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(task,responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,nil,error);
    }];
}


+(void)postWithURL:(NSString *)url andParams:(NSDictionary *)params callBack:(returnBlock)block{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,nil,error);
    }];
}

//post请求格式是二进制，上传2进制数据
+(void)postWithURLForData:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(returnBlock)block{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//请求格式二进制

    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager POST:url parameters:pamars progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,nil,error);
    }];
}

//请求url,带有中文
+(void)getWithURLForUTF8:(NSString *)url andParams:(NSDictionary *)pamars competionBlcok:(returnBlock)block{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSString *utf8Str = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(task,responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,nil,error);
    }];

}




/** 编码解码
 
 NSString* string1 = @"https://www.cloudsafe.com/文件夹";
 
 NSString* string2 = [string1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 NSString* string3 = [string2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
 NSString* string4 = [string2 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 NSString* string5 = [string3 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
 NSString* string6 = [string4 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 NSString* string7 = [string5 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
 输出结果: string5 & 6 重复编码encode
 
 string1:https://www.cloudsafe.com/文件夹
 
 string2:https://www.cloudsafe.com/%E6%96%87%E4%BB%B6%E5%A4%B9
 string3:https://www.cloudsafe.com/%25E6%2596%2587%25E4%25BB%25B6%25E5%25A4%25B9
 
 string4:https://www.cloudsafe.com/文件夹
 string5:https://www.cloudsafe.com/%E6%96%87%E4%BB%B6%E5%A4%B9
 
 string6:https://www.cloudsafe.com/文件夹
 string7:https://www.cloudsafe.com/文件夹
 */




@end
