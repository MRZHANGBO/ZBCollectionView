//
//  CollectionView.h
//  ZBCollectionView
//
//  Created by jx on 2018/10/23.
//  Copyright © 2018年 jx. All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol CollectionDelegate <NSObject>
-(void)ClickTag:(NSInteger)tag AndWithData:(NSArray*)Data;

@end
@interface CollectionView : UICollectionView
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,assign)NSInteger wtag;
@property (nonatomic, weak)id <CollectionDelegate>CollectionDelegate;
-(void)refreshData;
@end
