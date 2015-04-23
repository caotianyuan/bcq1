//
//  NewsTableView.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NewsTableView.h"
#import "NewsModel.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "TableViewCell.h"
#import "NewsDetailsViewController.h"


@interface NewsTableView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    UIScrollView *_secondScrollView;
    NSMutableArray *_dataArray;
    NSMutableArray *_scrollViewArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation NewsTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        _dataArray=[[NSMutableArray alloc]init];
        _scrollViewArray=[[NSMutableArray alloc]init];
        
        //self.backgroundColor = [UIColor yellowColor];
//        [self createSecondScrollView];
        [self createTableView];
        
        
    }
    return self;
}

-(void)setUrlStringAddReload:(NSString *)urlString
{
    _urlString=urlString;
    [self startDownload];
}

#pragma mark - 创建中间表格视图
-(void)createTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-120) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    [self createSecondScrollView];
    _tableView.tableHeaderView=_secondScrollView;
    [self addSubview:_tableView];
    
    
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NewsDetailsViewController *ndv=[[NewsDetailsViewController alloc]init];
//    ndv.model=_dataArray[indexPath.row];
//    [self.navigationController pushViewController:ndv animated:YES];
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cell";
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil)
    {
        cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    /*
     @property (strong,nonatomic) UIImageView *cover_picImage;
     @property (strong,nonatomic) UILabel *titleLabel;
     @property (strong,nonatomic) UILabel *descriptLabel;
     */
    NewsModel *newsModel=_dataArray[indexPath.row];
    [cell.cover_picImage setImageWithURL:[NSURL URLWithString:newsModel.cover_pic]];
    cell.titleLabel.text=newsModel.title;
    cell.descriptLabel.text=newsModel.descript;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *model=_dataArray[indexPath.row];
    if (self.pushView)
    {
        self.pushView(model);
    }
}

#pragma mark - 创建tableview的headScrollView
-(void)createSecondScrollView
{
    _secondScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
    _secondScrollView.pagingEnabled=YES;
    _secondScrollView.bounces=YES;
    
    //    _secondScrollView.backgroundColor=[UIColor cyanColor];
    
    
    //    [self.view addSubview:_secondScrollView];
}


#pragma mark mark - 数据下载
-(void)startDownload
{
//    NSLog(@"url-=---%@",self.urlString);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFCompoundResponseSerializer serializer];
    [manager GET:_urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSString *str=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"true");
        [self dealDownloadFinish:responseObject];
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"false");
         }];
    
}

-(void)dealDownloadFinish:(id)responseObject
{
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *data=dict[@"data"];
    NSArray *array=data[@"down_news"];
    
    
    for (NSDictionary *appDict in array)
    {
        //        [self createModelCodeWithDictionary:appDict modelName:@"AppModel"];
        NewsModel *model=[[NewsModel alloc]init];
        [model setValuesForKeysWithDictionary:appDict];
        [_dataArray addObject:model];
        //        NSLog(@"title=%@",model.title);
    }
    NSArray *array1=data[@"top_news"];
    
    for (NSDictionary *b1 in array1)
    {
        //        [self createModelCodeWithDictionary:b1 modelName:@"AppModel"];
        NewsModel2 *model=[[NewsModel2 alloc]init];
        //        [model setValuesForKeysWithDictionary:b1];
        model.title=b1[@"title"];
        model.cover_pic=b1[@"cover_pic"];
        [_scrollViewArray addObject:model];
        //        NSLog(@"%d",_scrollViewArray.count);
        //        NSLog(@"123456%@",model.cover_pic);
        
        [_tableView reloadData];
    }
    
    for (int i=0; i<_scrollViewArray.count; i++)
    {
        //        NSLog(@"123");
        NewsModel2 *model=_scrollViewArray[i];
        UIImageView *images=[[UIImageView alloc]initWithFrame:CGRectMake(i%5*320, 0, 320, 120)];
        [images setImageWithURL:[NSURL URLWithString:model.cover_pic]];
        images.userInteractionEnabled=YES;
        //            images.backgroundColor=[UIColor orangeColor];
        _secondScrollView.contentSize=CGSizeMake(320*_scrollViewArray.count, 120);
        [_secondScrollView addSubview:images];
        
        
    }
}


@end



