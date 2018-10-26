//
//  CollectionView.m
//  ZBCollectionView
//
//  Created by jx on 2018/10/23.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "CollectionView.h"
#import "hhCollectionViewCell.h"
#import "TwoViewController.h"
@interface CollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>
@end
@implementation CollectionView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
     self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setArray:(NSMutableArray *)array{
    if(array){
        _array = array;
    }
}
-(void)setWtag:(NSInteger)wtag{
    if (wtag) {
        _wtag = wtag;
    }
    [self setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*_wtag, 0 )];
}
-(void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.dataSource = self;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.bounces = YES;
    self.contentSize = CGSizeMake(_array.count * [UIScreen mainScreen].bounds.size.width, 0);
    self.pagingEnabled = YES;
   [self setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*_wtag, 0 )];

//    self.pageControl.currentPage = 0;

    [self registerNib:[UINib nibWithNibName:@"hhCollectionViewCell"bundle:nil]forCellWithReuseIdentifier:@"collectionCellID"];
    

}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.array.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    hhCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCellID" forIndexPath:indexPath];
    if (cell) {
        cell.hhhhh.image = [UIImage imageNamed:self.array[indexPath.row]];
    }
    
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = (int)(scrollView.contentOffset.x/scrollView.frame.size.width + 0.5)%5;

    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    [self updateUserInterfaceWithScrollViewContentOffset:scrollView.contentOffset];
//}
//- (void)updateUserInterfaceWithScrollViewContentOffset:(CGPoint)contentOffset {
//
//    if (self.contentOffset.x >= CGRectGetWidth(self.frame) * 3 + 1) {
//        self.contentOffset = CGPointMake(CGRectGetWidth(self.frame), 0);
//    }else if (self.contentOffset.x == 0){
//        self.contentOffset = CGPointMake(CGRectGetWidth(self.frame)*3, 0);
//    }
//
////    NSString *str = [NSString stringWithFormat:@"%ld/%ld",_currentIndex,_count];
////    _contentView.text = str;
//}
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width,200);
    return size;
}
//选中了哪一个
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"选中了哪一个%ld-----%@",indexPath.row,self.array);
    
    
    if ([_CollectionDelegate respondsToSelector:@selector(ClickTag: AndWithData:)]) {
        [_CollectionDelegate ClickTag:indexPath.row AndWithData:self.array];
    }
    
    
    //实现代理方式
    
}
-(void)refreshData{

    [self reloadData];

}
@end
