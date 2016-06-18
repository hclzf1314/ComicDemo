//
//  PopViewCell.m
//  ComicDemo
//
//  Created by Simon on 16/6/13.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "PopViewCell.h"
#import "PoPCollectionViewCell.h"
@interface PopViewCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end


@implementation PopViewCell
static NSString * const reuseIdentifier = @"CollectionViewCell";


- (void)awakeFromNib {
    // Initialization code
    
    //self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 328, 150) collectionViewLayout:];
    
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
   [self.collectionView registerNib:[UINib nibWithNibName:@"PoPCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor=[UIColor orangeColor];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PoPCollectionViewCell *cell = (PoPCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%s",__func__);
    //获取点击的单元格
    PoPCollectionViewCell *cell = (PoPCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    //获取点击的单元格
    PoPCollectionViewCell *cell = (PoPCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
