//
//  CGM_button.m
//  CGM_UIbutton
//
//  Created by apple on 16/8/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGM_button.h"



@implementation CGM_button


-(instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font =[UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment= NSTextAlignmentCenter;
        self.layer.borderWidth=0.3f;
        self.layer.shadowColor=[UIColor grayColor].CGColor;
    }
    return self;
}

-(void)setBtnTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}


-(void)setBackgroundImage:(NSString *)backImage{
    [self setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",backImage]] forState:UIControlStateNormal];
}

-(void)setColor:(UIColor *)color{
    [self setTitleColor:color forState:UIControlStateSelected];
}

-(void)setFont:(CGFloat )font{
    self.titleLabel.font =[UIFont systemFontOfSize:font];
}


@end
