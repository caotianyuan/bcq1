//
//  UploadViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "UploadViewController.h"
#import "UIKit+AFNetworking.h"
#import "AFNetworking.h"
#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)

@interface UploadViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITextField *_titleTextFied;
    UITextField *_contentTextField;
    UIImageView *_images;
    UIButton *_AddButton;
    UIButton *_videoButton;
    
    NSData *fileData;
}
@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
    
    fileData=[[NSData alloc]init];
    
    NSLog(@"123");
     NSLog(@"123");
     NSLog(@"123");
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"发送" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    rightButton.frame=CGRectMake(0, 0, 40, 30);
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=right;
    
    [self createUI];
}

-(void)createUI
{
    _titleTextFied=[[UITextField alloc]initWithFrame:CGRectMake(1.0/16*kScreenWidth, 8.0/32*kScreenHeight, 7.0/8*kScreenWidth, 2.0/48*kScreenHeight)];
    _titleTextFied.backgroundColor=[UIColor whiteColor];
    _titleTextFied.placeholder=@"标题";
    [self.view addSubview:_titleTextFied];
    
    _contentTextField=[[UITextField alloc]initWithFrame:CGRectMake(1.0/16*kScreenWidth, 8.0/32*kScreenHeight+4.0/48*kScreenHeight, 7.0/8*kScreenWidth, 6.0/48*kScreenHeight)];
    _contentTextField.placeholder=@"新闻内容";
    _contentTextField.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_contentTextField];
    
    _images=[[UIImageView alloc]initWithFrame:CGRectMake(3.0/32*kScreenWidth, 8.0/48*kScreenHeight+4.0/48*kScreenHeight+8.0/48*kScreenHeight+3.0/48*kScreenHeight, 5.0/32*kScreenWidth, 5.0/32*kScreenWidth)];
    _images.image=[UIImage imageNamed:@"share_panel_laiwang_session"];
    [self.view addSubview:_images];
    
    _AddButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_AddButton setBackgroundImage:[UIImage imageNamed:@"share_panel_laiwang_session"] forState:UIControlStateNormal];
    _AddButton.frame=CGRectMake(3.0/32*kScreenWidth+5.0/32*kScreenWidth+1.0/32*kScreenWidth, 8.0/48*kScreenHeight+4.0/48*kScreenHeight+8.0/48*kScreenHeight+3.0/48*kScreenHeight, 5.0/32*kScreenWidth, 5.0/32*kScreenWidth);
    [_AddButton addTarget:self action:@selector(AddButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //_AddButton.backgroundColor=[UIColor blackColor];
    [self.view addSubview:_AddButton];
    
    _videoButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_videoButton setTitle:@"查看本地视频" forState:UIControlStateNormal];
    [_videoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[_videoButton setBackgroundColor:[UIColor blackColor    ]];
    _videoButton.titleLabel.font=[UIFont systemFontOfSize:12];
    _videoButton.frame=CGRectMake(3.0/32*kScreenWidth, 8.0/48*kScreenHeight+4.0/48*kScreenHeight+8.0/48*kScreenHeight+3.0/48*kScreenHeight+5.0/32*kScreenWidth+2.0/48*kScreenHeight, 8.0/32*kScreenWidth, 3.0/48*kScreenHeight);
    [self.view addSubview:_videoButton];
}

#pragma mark - 点击按钮获取本地图片
-(void)AddButtonClick
{
    UIImagePickerController *ipc=[[UIImagePickerController alloc]init];
    ipc.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.allowsEditing=YES;
    ipc.delegate=self;
    [self presentViewController:ipc animated:YES completion:nil];
    
}

//完成选取
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(NSString *)kUTTypeImage])
    {
        
        
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];//将图片取出，赋给_picImageView
        fileData=UIImageJPEGRepresentation(image, 1);//获取后图片的质量，1的意思是跟原图一样，0.5的话就比原图模糊一半
        _images.image=[UIImage imageWithData:fileData];
        //    NSLog(@"self.fileData is %@",fileData);
        //    picImageView.image=image;
    }
    else if([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(NSString *)kUTTypeMovie])
    {
        
        //获取视频的路径
        NSString *path=[info objectForKey:UIImagePickerControllerMediaURL];
        fileData=[NSData dataWithContentsOfFile:path];
        //    NSLog(@"self.fileData is %@",fileData);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//取消操作
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - 发送新闻按钮
-(void)rightButtonClick
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSString *token=[userDefaults objectForKey:@"token"];
    NSString *postUrl=@"http://1000phone.net:8088/qfapp/index.php/juba/news/add_news";
    
     
    [manager POST:postUrl parameters:@{@"title":_titleTextFied.text,@"token":token,@"content":_contentTextField.text,@"cate_id":@"1"} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //上传模拟器里面的图片
        [formData appendPartWithFileData:fileData name:@"pic_file[]" fileName:@"hhhhhhh@2x.png" mimeType:@"image/png"];
    }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"message=%@",dict[@"message"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传失败");
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
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
