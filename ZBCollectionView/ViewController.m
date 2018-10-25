//
//  ViewController.m
//  ZBCollectionView
//
//  Created by jx on 2018/10/23.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "ViewController.h"
#import "CollectionView.h"
#import "TwoViewController.h"
@interface ViewController ()<CollectionDelegate,TwoViewControllerDelegate>
@property (nonatomic,strong)CollectionView *CollectView;
@property (nonatomic,strong)NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;//Inter cell spacing（每行内部cell item的间距）
    layout.minimumLineSpacing = 0;//Line spacing（每行的间距）
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    CollectionView *collectionView = [[CollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200) collectionViewLayout:layout];
    collectionView.CollectionDelegate = self;
    self.array =@[@"2",@"0",@"1",@"2",@"0"];
    
    collectionView.array  = [NSMutableArray arrayWithArray:self.array];
    collectionView.wtag = 4;
    [self.view addSubview:collectionView];
    self.CollectView = collectionView;
    
    UIButton *btn;
    btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 260, 418, 40)];
    
    [btn setTitle:@"sdfdsfd" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(haha) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
-(void)haha{
    
    self.array =@[@"4",@"5",@"6"];
    
    self.CollectView.array  = [NSMutableArray arrayWithArray:self.array];
    [self.CollectView refreshData];
}
-(void)ClickTag:(NSInteger)tag AndWithData:(NSArray *)Data{
    NSLog(@"第一个控制器-----------------%ld----------%lu",tag,(unsigned long)Data.count);
    TwoViewController *two = [[TwoViewController alloc]init];
    two.delegate = self;
    two.Array = Data;
    two.gtag = tag;
    [self presentViewController:two animated:NO completion:nil];
}
-(void)ClickTag:(NSInteger)tag{
    self.CollectView.wtag = tag;
    [self.CollectView refreshData];
    NSLog(@"第二个控制器传递过来的%ld",(long)tag);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
