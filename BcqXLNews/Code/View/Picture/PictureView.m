//
//  PictureView.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PictureView.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "PictureTableViewCell.h"
#import "PictureModel.h"

#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)

@interface PictureView ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    
}
@end

@implementation PictureView

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
    NSString *urlString=@"http://1000phone.net:8088/qfapp/index.php/juba/news/get_pic_news_list";
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
    NSDictionary *data=dict[@"data"];
//    NSArray *array=data[@"down_news"];
    
    
    for (NSDictionary *appDict in data)
    {
//                [self createModelCodeWithDictionary:appDict modelName:@"AppModel"];
        PictureModel *model=[[PictureModel alloc]init];
        [model setValuesForKeysWithDictionary:appDict];
        [_dataArray addObject:model];
                //NSLog(@"title=%@",model.title);
    }
    
        [_tableView reloadData];
    
}

-(void)createModelCodeWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName
{
    printf("@interface %s : NSObject\n",modelName.UTF8String);
    for (NSString *key in dict)
    {
        printf("@property (copy,nonatomic) NSString *%s;\n",key.UTF8String);
    }
    printf("\n@end\n");
}

#pragma mark 创建tableView
-(void)createTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-65) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self addSubview:_tableView];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"321");
    static NSString *cellID=@"cell";
    PictureTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil)
    {
        cell=[[PictureTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    PictureModel *model=_dataArray[indexPath.row];
    cell.titleLabel.text=model.title;
    cell.descriptLabel.text=model.descript;
    
    [cell.images1 setImageWithURL:[NSURL URLWithString:model.pic_list[0]]];
    [cell.images2 setImageWithURL:[NSURL URLWithString:model.pic_list[1]]];
    [cell.images3 setImageWithURL:[NSURL URLWithString:model.pic_list[2]]];
    /*
     */
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return kScreenHeight*3/4;
    
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}



@end
