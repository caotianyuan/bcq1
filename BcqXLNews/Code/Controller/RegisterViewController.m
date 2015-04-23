//
//  RegisterViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RegisterViewController.h"
#import "NextViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface RegisterViewController ()<UITextFieldDelegate>
- (IBAction)cancelClick:(id)sender;
- (IBAction)NextButtonClick:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _usernameTextField.delegate=self;
    _passwordTextField.delegate=self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    return YES;
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

- (IBAction)cancelClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)NextButtonClick:(id)sender
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    NSString *postUrl=@"http://1000phone.net:8088/qfapp/index.php/juba/index/do_register";
    
    [manager POST:postUrl parameters:@{@"username":self.usernameTextField.text,@"password":self.passwordTextField.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"message=%@",dict[@"message"]);
        
        if(![dict[@"message"] isEqualToString:@"注册成功"])
        {
            UIAlertView *alert=[[UIAlertView alloc]init];
            alert.message=@"注册失败";
            [alert addButtonWithTitle:@"取消"];
            [alert show];
        }
        else
        {
            NextViewController *next=[[NextViewController alloc] init];
            [self.navigationController pushViewController:next animated:YES];
            NSLog(@"成功");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"注册失败");
    }];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
     self.navigationController.navigationBarHidden=YES;
}

//-(void)viewDidDisappear:(BOOL)animated
//{
//   
//}

@end
