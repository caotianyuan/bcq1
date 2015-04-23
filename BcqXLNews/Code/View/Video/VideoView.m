//
//  VideoView.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "VideoView.h"
#import "VideoTableViewCell.h"
#import "VideoModel.h"
#import "UIKit+AFNetworking.h"
#import "AFNetworking.h"
#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)
@interface VideoView ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
@end

@implementation VideoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.userInteractionEnabled=YES;
        
        _dataArray=[[NSMutableArray alloc]init];
        
        //self.backgroundColor = [UIColor yellowColor];
        //        [self createSecondScrollView];
        [self createTableView];
        
        [self startDownload];
        
        
    }
    return self;
}

#pragma mark - 解析数据
-(void)startDownload
{
    NSString *urlString=@"http://1000phone.net:8088/qfapp/index.php/juba/news/get_video_news_list";
    //    NSLog(@"url-=---%@",self.urlString);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFCompoundResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
    //NSDictionary *data=dict[@"data"];
    NSArray *array=dict[@"data"];
    //    NSArray *array=data[@"down_news"];
    
    //NSLog(@"123456");
    for (NSDictionary *appDict in array)
    {
        //[self createModelCodeWithDictionary:appDict modelName:@"AppModel"];
        VideoModel *model=[[VideoModel alloc]init];
        [model setValuesForKeysWithDictionary:appDict];
        [_dataArray addObject:model];
        //NSLog(@"title=%@",model.title);
    }
    
    [_tableView reloadData];
    
}

#pragma mark - 创建tableView
-(void)createTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-65) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cell";
    VideoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil)
    {
        cell=[[VideoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }

    /*
     @property (strong,nonatomic) NSString *title;
     @property (strong,nonatomic) NSString *video_url;
     @property (retain,nonatomic) NSNumber *play_num;
     @property (strong,nonatomic) NSString *pic;

     */
    
    VideoModel *videoModel=_dataArray[indexPath.row];
    //;
    //[images setImageWithURL:[NSURL URLWithString:model.cover_pic]];
    [cell.picImage setImageWithURL:[NSURL URLWithString:videoModel.pic]];
    cell.titleLabel.text=videoModel.title;
    cell.play_numLabel.text=[NSString stringWithFormat:@"%@万播放",videoModel.play_num];


    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (kScreenHeight-65)/2;
}





@end
