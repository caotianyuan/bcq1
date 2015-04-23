//
//  VideoViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoView.h"
#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)


@interface VideoViewController ()
{
    UIScrollView *_scrollView;
}

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, kScreenWidth, kScreenHeight-65)];
    _scrollView.contentSize=CGSizeMake(kScreenWidth*4, kScreenHeight-65);
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces=YES;
    _scrollView.showsVerticalScrollIndicator=NO;
    _scrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:_scrollView];
    
    for (int i=0; i<4; i++)
    {
        VideoView *video=[[VideoView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight-65)];
        [_scrollView addSubview:video];
    }
    
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
