//
//  CGM_ScrollImageView.m
//  轮播图封装
//
//  Created by admin on 16/7/3.
//  Copyright © 2016年 package. All rights reserved.
//

#import "CGM_ScrollImageView.h"
#import "UIImageView+WebCache.h"
#define KmainWidth  self.bounds.size.width
#define KmainHeiht  self.bounds.size.height
@interface CGM_ScrollImageView()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UIPageControl *page;
@property (retain,nonatomic)NSTimer    *timer;
@property (nonatomic,assign)NSInteger count;

@end

@implementation CGM_ScrollImageView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _count = 0;
        [self addSubview:self.scrollVoid];
    }
    return self;
}


-(UIScrollView *)scrollVoid{
    _scrollview =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.scrollsToTop = NO;
    _scrollview.pagingEnabled =YES;
    _scrollview.bounces = NO;
    _scrollview.backgroundColor =[UIColor whiteColor];
    _scrollview.delegate =self;
    _scrollview.contentOffset=CGPointMake(KmainWidth, 0);
    
    return _scrollview ;
}

//复写set ,获得传过来的图片数据
-(void)setImageArr:(NSArray<NSString *> *)imageArr{
    _imageArr = imageArr;
    if (_scrollview.subviews.count!=0) {
        _scrollview.contentSize=CGSizeMake(KmainWidth*(_imageArr.count+2), KmainHeiht);
         UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapcilck:)];
        _scrollview.userInteractionEnabled=YES;
        [_scrollview addGestureRecognizer:tap];
        
        for(int i =0 ;i<_imageArr.count+2;i++){
            
            if (i == 0) { //第一张放最后一张图片
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KmainWidth, KmainHeiht)];
                [imageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:[UIImage imageNamed:_BckImage]];
                
                [_scrollview addSubview:imageView];
                
                
            }else if (i ==_imageArr.count+1){  //如果是最后一张就放第一张图片
                
                UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(KmainWidth*i, 0, KmainWidth, KmainHeiht)];
                [imageview sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:[UIImage imageNamed:_BckImage]];
                
                [_scrollview addSubview:imageview];
                
                
            }else{
                UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(KmainWidth*i, 0, KmainWidth, KmainHeiht)];
    
                [imageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[i-1]] placeholderImage:[UIImage imageNamed:_BckImage]];
                [_scrollview addSubview:imageView];
                
            }
        }
        [self createPageControl];

    }
}

-(void)createPageControl{
    
    _page =[[UIPageControl alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width, 20)];
    _page.tag = 20;
    // 点数:
    _page.numberOfPages = _imageArr.count;
    // 当前第几个点:
    _page.currentPage = 0;
    // 点的颜色:
    _page.pageIndicatorTintColor = [UIColor whiteColor];
    // 当前点颜色:
    _page.currentPageIndicatorTintColor = [UIColor redColor];
    // 添加目标对象:
    [_page addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:_page];

}

-(void)changePage:(UIPageControl *)page{
    [_scrollview setContentOffset:CGPointMake(page.currentPage*KmainWidth, 0) animated:YES];
}

-(void)tapcilck:(UITapGestureRecognizer  *)tap{
    NSInteger index = (int)(_scrollview.contentOffset.x/KmainWidth-1)%_imageArr.count;
   // self.pageBlock(index); //回调
    NSLog(@"%ld",index);
}

#pragma UIScrollviewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x/KmainWidth==0) {  //if 是第一张
        scrollView.contentOffset = CGPointMake(KmainWidth*_imageArr.count, 0);//切换到最后2张
    }else if (scrollView.contentOffset.x/KmainWidth==_imageArr.count+1){
        scrollView.contentOffset=CGPointMake(KmainWidth, 0);
    }
    _page.currentPage = scrollView.contentOffset.x/KmainWidth-1;
    _count =_page.currentPage+1;
    [self timerStart];
}

// 已经停止拖拽调用:
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"已经停止拖拽....");
    
}


// 将要减速
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self timerOff];
    _page.currentPage = scrollView.contentOffset.x/KmainWidth-1;
    _count =_page.currentPage+1;
}


#pragma mark - 定时器
//关闭timer
-(void)timerOff{
    [_timer invalidate];
    _timer = nil;
}

//开启timer
-(void)timerStart{
    [self timerOff];
    if (_timer != nil) return;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_times target:self selector:@selector(timerFirst) userInfo:nil repeats:YES];
}

//计时器触发函数
- (void)timerFirst{
    _count++;
    if (_count == _imageArr.count+1) {
        _count = 1;
        _scrollview.contentOffset = CGPointMake(0, 0);
    }
    [_scrollview setContentOffset:CGPointMake(KmainWidth*_count, 0) animated:YES];
    _page.currentPage=_count-1;
    
}




@end
