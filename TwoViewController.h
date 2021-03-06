//
//  TwoViewController.h
//  ZBCollectionView
//
//  Created by jx on 2018/10/24.
//  Copyright © 2018年 jx. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TwoViewControllerDelegate <NSObject>
-(void)ClickTag:(NSInteger)tag andWith:(NSArray*)nest;

@end
@interface TwoViewController : UIViewController
@property (nonatomic,strong)NSArray *dataA;
@property (nonatomic,assign)NSInteger gtag;
@property (nonatomic, weak)id <TwoViewControllerDelegate>delegate;

@end
