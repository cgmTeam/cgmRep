//
//  A_ViewController.m
//  属性传值
//
//  Created by zyx on 16/3/18.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "A_ViewController.h"
#import "B_ViewController.h"


@interface A_ViewController () <Nextprotocol>

{
    UITextField *aTextField;
    B_ViewController *bViewController;
}

@end

@implementation A_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"A";
    self.view.backgroundColor = [UIColor whiteColor];
    aTextField = [[UITextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, 200, 100, 30)];
    
    aTextField.layer.borderColor = [UIColor grayColor].CGColor;
    aTextField.layer.borderWidth = 1;
    [self.view addSubview:aTextField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, 280, 100, 30);
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitle:@"传到B" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    /*  写这里也可以
    bViewController = [[B_ViewController alloc] init];
    
    bViewController.delegate = self;
    
     */
    
}




-(void)buttonAction:(UIButton *)sender {

    
    bViewController = [[B_ViewController alloc] init];
    
    // 遵循代理
    bViewController.delegate = self;
    

    [self.navigationController pushViewController:bViewController animated:YES];
    
    
}

// 从 B 从到A
// 执行代理方法
- (void)transferString:(NSString *)string {
    
    aTextField.text = string;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
