//
//  NextViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NextViewController.h"
#import "PersonViewController.h"

#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    rightButton.frame=CGRectMake(0, 0, 40, 30);
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=right;
}

-(void)rightButtonClick
{
    PersonViewController *person=[[PersonViewController alloc]init];
    [self.navigationController pushViewController:person animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
}

-(void)viewDidDisappear:(BOOL)animated
{
    
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
