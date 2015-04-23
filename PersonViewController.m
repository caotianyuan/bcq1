//
//  PersonViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PersonViewController.h"
#import "LoginViewController.h"

#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)

@interface PersonViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_button;
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    NSArray *array1=@[@"离线下载",@"夜间模式",@"头条推送",@"仅Wi-Fi下载图片",@"离线设置",@"正文字号",@"清除缓存"];
    NSArray *array2=@[@"反馈",@"检查更新",@"关于",@"应用中心"];
    _dataArray=[[NSMutableArray alloc]initWithObjects:array1,array2, nil];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *headImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight/4)];
    headImage.image=[UIImage imageNamed:@"UseCenterWeatherBGSnow.png"];
    headImage.userInteractionEnabled=YES;
    [self.view addSubview:headImage];
    
    
    _button=[UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"登陆" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    _button.frame=CGRectMake(11.0/32*kScreenWidth, 3.0/48*kScreenHeight, 10.0/32*kScreenWidth, 3.0/48*kScreenHeight);
    _button.backgroundColor=[UIColor blackColor];
    [headImage addSubview:_button];
    
    UIButton *logoutButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [logoutButton setTitle:@"注销" forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(logoutClick:) forControlEvents:UIControlEventTouchUpInside];
    logoutButton.backgroundColor=[UIColor blackColor];
    logoutButton.frame=CGRectMake(11.0/32*kScreenWidth,  7.0/48*kScreenHeight, 10.0/32*kScreenWidth, 3.0/48*kScreenHeight);
    [headImage addSubview:logoutButton];
    
    NSArray *array=@[@"收藏",@"评论",@"17/3"];
    for (int i=0; i<3; i++)
    {
        UIButton *headButton=[UIButton buttonWithType:UIButtonTypeCustom];
        headButton.frame=CGRectMake(i*(kScreenWidth/3), kScreenHeight/4+20, kScreenWidth/3, 3.0/48*kScreenHeight);
        [headButton setTitle:array[i] forState:UIControlStateNormal];
        headButton.tag=10+i;
        headButton.backgroundColor=[UIColor blackColor];
        [self.view addSubview:headButton];
    }

    [self createTableView];
    
}

#pragma mark - 创建tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

//创建tableView
-(void)createTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kScreenHeight/4+20+3.0/48*kScreenHeight, kScreenWidth, kScreenHeight-(kScreenHeight/4+20+3.0/48*kScreenHeight+20)) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_tableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *cellID=@"cell";
    //UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text=_dataArray[indexPath.section][indexPath.row];
    if (indexPath.section==0&&(indexPath.row==2||indexPath.row==3||indexPath.row==4))
    {
        UISwitch *switch1=[[UISwitch alloc]initWithFrame:CGRectMake(26.0/32*kScreenWidth, 0, 4.0/32*kScreenWidth, 3.0/48*kScreenHeight)];
        [cell.contentView addSubview:switch1];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array=_dataArray[section];
    return array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 3.0/48*kScreenHeight;
}



-(void)logoutClick:(UIButton *)sender
{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"username"];
    [self viewWillAppear:YES];
}

-(void)btnClick
{
    LoginViewController *lvc=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [_button setTitle:[userDefaults objectForKey:@"username"] forState:UIControlStateNormal];
    if ([userDefaults objectForKey:@"username"]==nil)
    {
        [_button setTitle:@"登录" forState:UIControlStateNormal];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
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
