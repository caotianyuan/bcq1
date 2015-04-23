//
//  PictureViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PictureViewController.h"
#import "PictureView.h"

#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)

@interface PictureViewController ()
{
    UIScrollView *_ScrollView;
}
@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.userInteractionEnabled=YES;
    
    _ScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, kScreenWidth, kScreenHeight-65)];
    _ScrollView.contentSize=CGSizeMake(kScreenWidth*4, kScreenHeight-65);
    _ScrollView.pagingEnabled=YES;
    _ScrollView.bounces=YES;
    _ScrollView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:_ScrollView];
    [self createTableView];
}

-(void)createTableView
{
    for (int i=0; i<4; i++)
    {
        PictureView *pic=[[PictureView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight-65)];
        [_ScrollView addSubview:pic];
    }
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
