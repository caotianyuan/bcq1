//
//  NewsDetailsViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-19.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NewsDetailsViewController.h"
#import "NewsDetailsModel.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface NewsDetailsViewController ()
{
    NSMutableArray *_dataArray;
    
}
@end

@implementation NewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray=[[NSMutableArray alloc]init];
//    [self startDownload];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 65, 300, 60)];
    label.numberOfLines=0;
    label.text=self.model.title;
    [self.view addSubview:label];
    
    UITextView *bodyText=[[UITextView alloc]initWithFrame:CGRectMake(10, 135, 300, 300)];
    bodyText.text=self.model.content;
    bodyText.font=[UIFont systemFontOfSize:14];
//    bodyText.backgroundColor=[UIColor blackColor];
    //不允许编辑
    [bodyText setEditable:NO];
    [self.view addSubview:bodyText];
    
}

#pragma mark mark - 数据下载
//-(void)startDownload
//{
//    NSString *urlString=@"http://1000phone.net:8088/qfapp/index.php/juba/news/news_detail";
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    manager.responseSerializer=[AFCompoundResponseSerializer serializer];
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //        NSString *str=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
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
//   // NSArray *array=dict[@"data"];
////    for (NSDictionary *appDict in dict[@"data"])
//    
//        //        [self createModelCodeWithDictionary:appDict modelName:@"AppModel"];
//        NewsDetailsModel *model=[[NewsDetailsModel alloc]init];
//        [model setValuesForKeysWithDictionary:data];
//        [_dataArray addObject:model];
//    
//        
//        
//        NSLog(@"title=%@",model.title);
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=NO;
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
