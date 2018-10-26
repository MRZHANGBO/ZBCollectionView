//
//  TwoViewController.m
//  ZBCollectionView
//
//  Created by jx on 2018/10/24.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "TwoViewController.h"
#import "CollectionView.h"
#import "HSLeftPresentAnimation.h"
@interface TwoViewController ()<CollectionDelegate,CAAnimationDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic,strong)CollectionView *CollectView;
@property (nonatomic,strong)NSArray *arrayA;

/**记录回调信息*/
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)NSArray *data;


@property (nonatomic, strong) UIPercentDrivenInteractiveTransition*
interactiveTransition;
@end

@implementation TwoViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.transitioningDelegate = self;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    HSLeftPresentAnimation* leftPresentAnimation = [[HSLeftPresentAnimation alloc] init];
    leftPresentAnimation.isPresent = NO;
    return leftPresentAnimation;
    
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.interactiveTransition;
}


-(void)viewWillAppear:(BOOL)animated{
    self.data = [NSArray array];
    NSLog(@"%@",self.dataA);
    self.view.backgroundColor = [UIColor blackColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;//Inter cell spacing（每行内部cell item的间距）
    layout.minimumLineSpacing = 0;//Line spacing（每行的间距）
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CollectionView *collectionView = [[CollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200) collectionViewLayout:layout];
    collectionView.array  = [NSMutableArray arrayWithArray:self.dataA];
    [collectionView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*self.gtag, 0 )];
    self.CollectView = collectionView;
    collectionView.CollectionDelegate = self;
    
    [self.view addSubview:collectionView];
    
//    [self.CollectView refreshData];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
    

        NSLog(@"假装在努力下载...%@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"假装在更新UI...%@",[NSThread currentThread]);
            [UIView animateWithDuration:2 animations:^{
        
                NSLog(@"%@", [NSThread currentThread]);
        self.CollectView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2-100,  [UIScreen mainScreen].bounds.size.width, 200);
                
                
            } completion:^(BOOL finished) {

            }];


        });
    });

    
}
- (void)viewDidLoad {
    [super viewDidLoad];


}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    self.view.alpha = 1;
    if (_delegate && [_delegate respondsToSelector:@selector(ClickTag: andWith:)]) {
        [_delegate ClickTag:self.index andWith:self.dataA];

    }
    [UIView animateWithDuration:2 animations:^{

        NSLog(@"%@", [NSThread currentThread]);
        self.CollectView.frame = CGRectMake(0, 0,  [UIScreen mainScreen].bounds.size.width, 200);
            [self dismissViewControllerAnimated:YES completion:nil];


    } completion:^(BOOL finished) {

    }];
//


}
-(void)ClickTag:(NSInteger)tag AndWithData:(NSArray *)Data{
    NSLog(@"第二个控制器%ld,%ld",tag,Data.count);
    self.index = tag;
    self.data = Data;
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
