//
//  NewsViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NewsViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "NewsModel.h"
#import "TableViewCell.h"
#import "NewsDetailsViewController.h"
#import "NewsTableView.h"
#import "UploadViewController.h"


@interface NewsViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_AllScrollView;
    UIScrollView *_headScrollView;
    UIScrollView *_secondScrollView;
    
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSMutableArray *_scrollViewArray;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//     [self startDownload];
//    _dataArray=[[NSMutableArray alloc]init];
//    _scrollViewArray=[[NSMutableArray alloc]init];
    
    //用到ScrollView的地方最好把自动布局关了
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _headScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 25, 280, 40)];
//    _headScrollView.backgroundColor=[UIColor purpleColor];
    _headScrollView.delegate=self;
    _headScrollView.contentSize=CGSizeMake(320+110, 0);
    
    //让初始位置停留在那里
//    _headScrollView.contentOffset=CGPointMake(300, 0);
//    _headScrollView.backgroundColor=[UIColor whiteColor];
   
    _headScrollView.bounces=YES;
    _headScrollView.pagingEnabled=NO;
    [self.view addSubview:_headScrollView];
    [self createHeadButton];
    [self createTableView];
//    [self createTableView];
    
    
    

//    [self createSecondScrollView];
    
//    UIImageView *a=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
//    a.backgroundColor=[UIColor redColor];
//    [self.view addSubview:a];
    
}

//#pragma mark mark - 数据下载
//-(void)startDownload
//{
//    NSString *urlString=@"http://1000phone.net:8088/qfapp/index.php/juba/news/get_news_list";
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    manager.responseSerializer=[AFCompoundResponseSerializer serializer];
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
////        NSString *str=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"true");
//        [self dealDownloadFinish:responseObject];
//    }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             NSLog(@"false");
//         }];
//    
//}
//
//-(void)dealDownloadFinish:(id)responseObject
//{
//    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//    NSDictionary *data=dict[@"data"];
//    NSArray *array=data[@"down_news"];
//   
//    
//    for (NSDictionary *appDict in array)
//    {
////        [self createModelCodeWithDictionary:appDict modelName:@"AppModel"];
//        NewsModel *model=[[NewsModel alloc]init];
//        [model setValuesForKeysWithDictionary:appDict];
//        [_dataArray addObject:model];
////        NSLog(@"title=%@",model.title);
//    }
//    NSArray *array1=data[@"top_news"];
//   
//    for (NSDictionary *b1 in array1)
//    {
////        [self createModelCodeWithDictionary:b1 modelName:@"AppModel"];
//        NewsModel2 *model=[[NewsModel2 alloc]init];
////        [model setValuesForKeysWithDictionary:b1];
//        model.title=b1[@"title"];
//        model.cover_pic=b1[@"cover_pic"];
//        [_scrollViewArray addObject:model];
////        NSLog(@"%d",_scrollViewArray.count);
////        NSLog(@"123456%@",model.cover_pic);
//        
//        [_tableView reloadData];
//    }
//   
//    for (int i=0; i<_scrollViewArray.count; i++)
//    {
//        //        NSLog(@"123");
//        NewsModel2 *model=_scrollViewArray[i];
//        UIImageView *images=[[UIImageView alloc]initWithFrame:CGRectMake(i%5*320, 0, 320, 120)];
//        [images setImageWithURL:[NSURL URLWithString:model.cover_pic]];
//        images.userInteractionEnabled=YES;
//        //            images.backgroundColor=[UIColor orangeColor];
//        _secondScrollView.contentSize=CGSizeMake(320*_scrollViewArray.count, 120);
//        [_secondScrollView addSubview:images];
//        
//        
//    }
//}

/*
 
 men.local:  2015-03-17 22:13:43
 #pragma mark - 加载和解析tableView数据
 -(void)dealDownloadFinish:(id )responseObject
 {
 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
 NSDictionary *data=dict[@"data"];
 NSArray *array=data[@"down_news"];
 
 for (NSDictionary *item in array)
 {
 headlinesModel *model=[[headlinesModel alloc]init];
 [model setValuesForKeysWithDictionary:item];
 [_dataArray addObject:model];
 }
 NSArray *topArray=data[@"top_news"];
 for (NSDictionary *item in topArray)
 {
 TopModel *model=[[TopModel alloc]init];
 [model setValuesForKeysWithDictionary:item];
 [_scrollViewDataArray addObject:model];
 }
 
*/

//用字典生成model属性的代码
-(void)createModelCodeWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName
{
    printf("@interface %s : NSObject\n",modelName.UTF8String);
    for (NSString *key in dict)
    {
        printf("@property (copy,nonatomic) NSString *%s;\n",key.UTF8String);
    }
    printf("\n@end\n");
}

#pragma mark - 创建中间表格视图
-(void)createTableView
{
//    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 65, 320, 480-120) style:UITableViewStylePlain];
//    _tableView.dataSource=self;
//    _tableView.delegate=self;
    
//      [self createSecondScrollView];
//    _tableView.tableHeaderView=_secondScrollView;
//    [self.view addSubview:_tableView];
    
    _AllScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, 320, 480-65)];
    _AllScrollView.contentSize=CGSizeMake(320*3, 480-65);
    _AllScrollView.pagingEnabled=YES;
    _AllScrollView.bounces=YES;
    _AllScrollView.delegate=self;
    [self.view addSubview:_AllScrollView];
    
    for (int i=0; i<3; i++)
    {
        NewsTableView *newsTableView=[[NewsTableView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 480-65)];
        NSString *string=[NSString stringWithFormat:@"http://1000phone.net:8088/qfapp/index.php/juba/news/get_news_list?cate_id=%d",i+1];
        [newsTableView setUrlStringAddReload:string];
        
        //点击tableView推出详情界面
        [newsTableView setPushView:^(NewsModel *model)
         {
             NewsDetailsViewController *news=[[NewsDetailsViewController alloc]init];
             news.model=model;
             [self.navigationController pushViewController:news animated:YES];
         }];
        
        
        
        [_AllScrollView addSubview:newsTableView];
    }
    
    
    
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NewsDetailsViewController *ndv=[[NewsDetailsViewController alloc]init];
//    ndv.model=_dataArray[indexPath.row];
//    [self.navigationController pushViewController:ndv animated:YES];
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return _dataArray.count;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *cellID=@"cell";
//    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell==nil)
//    {
//        cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//    }
//    
//    /*
//     @property (strong,nonatomic) UIImageView *cover_picImage;
//     @property (strong,nonatomic) UILabel *titleLabel;
//     @property (strong,nonatomic) UILabel *descriptLabel;
//     */
//    NewsModel *newsModel=_dataArray[indexPath.row];
//    [cell.cover_picImage setImageWithURL:[NSURL URLWithString:newsModel.cover_pic]];
//    cell.titleLabel.text=newsModel.title;
//    cell.descriptLabel.text=newsModel.descript;
//    
//    
//    return cell;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 80;
//}

//#pragma mark - 创建tableview的headScrollView
//-(void)createSecondScrollView
//{
//     _secondScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
//    _secondScrollView.pagingEnabled=YES;
//    _secondScrollView.bounces=YES;
//    
////    _secondScrollView.backgroundColor=[UIColor cyanColor];
//  
//    
////    [self.view addSubview:_secondScrollView];
//}

#pragma mark - 创建头部视图
-(void)createHeadButton
{
   
    NSArray *headButtonArray=@[@"头条",@"娱乐",@"体育",@"财经",@"科技",@"汽车",@"搞笑",@"北京"];
    for (int i=0; i<8; i++)
    {
        UIButton *headButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [headButton setTitle:headButtonArray[i] forState:UIControlStateNormal];
        headButton.tag=10+i;
        headButton.frame=CGRectMake(5+i*15+i*40, 0, 40, 40);
//        headButton.backgroundColor=[UIColor orangeColor];
        headButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [headButton addTarget:self action:@selector(headButton:) forControlEvents:UIControlEventTouchUpInside];
        [_headScrollView addSubview:headButton];
    }
    UIButton *headLastButton=[UIButton buttonWithType:UIButtonTypeCustom];
    headLastButton.frame=CGRectMake(280, 35, 30, 30);
    [headLastButton setBackgroundImage:[UIImage imageNamed:@"piccell_imagecount_icon"] forState:UIControlStateNormal];
    [headLastButton addTarget:self action:@selector(lastButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headLastButton];
}

#pragma 点击上面的button，让scrollView跟着一起动
-(void)headButton:(UIButton*)sender
{
    _AllScrollView.contentOffset=CGPointMake(320*(sender.tag-10),0);
    _headScrollView.contentOffset=CGPointMake(40*(sender.tag-10), 0);
}

#pragma 滑动scrollView，让上面的button跟着一起动
//将开始降速时执行
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
{
    _headScrollView.contentOffset=CGPointMake(40*_AllScrollView.frame.size.width/320, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    _headScrollView.contentOffset=CGPointMake(40*_AllScrollView.contentOffset.x/320, 0);
//    NSLog(@"%f",_AllScrollView.contentOffset.x/320);
}



-(void)lastButtonClick
{
    UploadViewController *uvc=[[UploadViewController alloc]init];
    [self.navigationController pushViewController:uvc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
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
