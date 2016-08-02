//
//  CGM_TabbarController.m
//  ManagementSystem
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 com.Managementsystem. All rights reserved.
//

#import "CGM_TabbarController.h"
#import "homePageViewController.h"
#import "MeCrtlViewController.h"
#import "groupViewController.h"
#import "LoginViewController.h"
@interface CGM_TabbarController ()
{
    UIButton *_tempButton; // 记录上一次选择的button;

}
@end

@implementation CGM_TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
       //添加控制器
    NSArray *ctrlArr =@[@"homePageViewController",@"groupViewController",@"MeCrtlViewController"];
    //添加控制器
    NSMutableArray *Arr =[NSMutableArray array];
    for (int i = 0; i<ctrlArr.count; i++) {
        Class   class = NSClassFromString(ctrlArr[i]);
        if (class) {
            UIViewController *vc =[[class alloc] init];
            UINavigationController *nv =[[UINavigationController alloc] initWithRootViewController:vc];//添加NvBar管理
            [Arr addObject:nv];
        }
    }
    self.viewControllers = Arr;
    [self CustomTaBar]; //自定义tabbar
    
}

-(void)CustomTaBar{
    
    //先隐藏掉系统的tabbar，系统坐标范围是（0, 0, [UIScreen mainScreen].bounds.size.width, 49）
    //  [self.tabBar setShadowImage:[UIImage new]];//这行代码可以把tabbar上的最顶部细线变成透明
    [self.tabBar setBackgroundImage:[UIImage new]];//tabber背景替换成一张透明图片
    NSArray *imageArr = @[@"wholemenu_ico_index00_n_uncheck@3x",@"wholemenu_ico_special00_n_uncheck@3x",@"wholemenu_ico_user00_n_uncheck@3x.png"];
    NSArray *slecteImageArr =@[@"wholemenu_ico_index00_n_check@3x",@"wholemenu_ico_special00_n_check@3x",@"wholemenu_ico_user00_n_check@3x"];
    NSArray *title =@[@"首页",@"分类",@"我的"];

    UIView *view =[[UIImageView alloc]initWithFrame:CGRectMake( 0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    view.backgroundColor = [UIColor grayColor];
    view.userInteractionEnabled = YES; //确保用户交互打开
    
    
    CGFloat itemBtton =KmainWidth / title.count;
    
    for (int i = 0; i< imageArr.count; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(itemBtton*i, 0, itemBtton, 49);
        btn.tag = 1000+i;
        //标题字大小
        btn.titleLabel.font =[UIFont systemFontOfSize:10];
        //文字
        [btn setTitle:title[i] forState:UIControlStateNormal];
        //文字颜色 默认
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //选中
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];

        //图片赋值,默认
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        //选中状态
        [btn setImage:[UIImage imageNamed:slecteImageArr[i]] forState:UIControlStateSelected ];
        
        //按钮图文位置的计算
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        CGFloat f = btn.imageView.bounds.size.width;//按钮图片宽度
        btn.imageEdgeInsets = UIEdgeInsetsMake(-14, itemBtton/2-f/2, 0, 0);//图片高度偏移量自己设置， 默认-14
        CGFloat l = btn.titleLabel.bounds.size.width;//按钮文字宽度
        btn.titleEdgeInsets = UIEdgeInsetsMake(21, -f - l/2 +itemBtton/2, 0, 0);//标题高度偏移量自己设置，默认21
        
    
        //点击事件
        [btn addTarget:self action:@selector(cilckbt:) forControlEvents:UIControlEventTouchUpInside];
    
        //默认选中第一个
        if(i==0){
            btn.selected = YES;
            _tempButton =  btn;
        }
        [view addSubview:btn];

    }
    [self.tabBar addSubview:view];
}

-(void)cilckbt:(UIButton *)btn{
//    BOOL islogin = NO;
//    if (!islogin) {
//        LoginViewController *login =[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//        [self presentViewController:login animated:YES completion:nil];
//    }
    
    _tempButton.selected = NO;
    btn.selected = YES;
    _tempButton = btn;
    
    self.selectedIndex =btn.tag - 1000;
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
