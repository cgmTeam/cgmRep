//
//  ViewController.m
//  ArrAnddictionTurnJson
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dic1=@{@"key":@"demo",@"string":@"6666"};
    NSMutableDictionary *dic  = [[NSMutableDictionary alloc] initWithDictionary:dic1];
    
    NSArray *arr =@[@"1",@"2",@"3"];
    
    [dic setObject:arr forKey:@"arr"];
    
    
    //字典转json
    NSError *error = nil;
    NSData *jsonData =[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    
    if ([jsonData length]>0&&error==nil) {
        //NSData转换为String
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",jsonString);
    }  else if ([jsonData length] == 0 &&error == nil){
        NSLog(@"No data was returned after serialization.");
    }
    else if (error != nil){
        NSLog(@"An error happened = %@", error);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
