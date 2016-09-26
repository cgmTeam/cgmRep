//
//  ViewController.m
//  复选Demo
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

#import "selectModel.h"

#import "CustomCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ViewController

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor =[UIColor yellowColor];
    
    [self.collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionview registerNib:[UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CustomCollectionViewCell"];
    
    for (int i = 0; i<20 ; i++) {
        selectModel *model =[[selectModel alloc] init];
        model.state = @"1";
        [self.dataSource addObject:model];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIcolectionviewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    CustomCollectionViewCell *CustomCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionViewCell" forIndexPath:indexPath];
    
    selectModel *model = self.dataSource[indexPath.row];
    
    
    if ([model.state isEqualToString:@"1"]) {
        cell.backgroundColor =[UIColor whiteColor];
        return cell;

    }else{
        CustomCollectionViewCell.backgroundColor =[UIColor redColor];
        return CustomCollectionViewCell ;
    }
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    selectModel *model = self.dataSource[indexPath.row];
   
    //遍历全部恢复最初的状态
    for (selectModel *model in self.dataSource) {
        model.state = @"1";
    }
    
    
    //改变选中的cell 状态
    model.state = @"0";

    for (selectModel *model in self.dataSource) {
        NSLog(@"%@",model.state);
    }
    
    
    [self.collectionview reloadData];
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"wwwwww%ld",indexPath.row);
    
}




@end
