//
//  LoginViewController.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "PersonViewController.h"
#import "ForgetPasswordViewController.h"
#import "UIKit+AFNetworking.h"
#import "AFNetworking.h"


@interface LoginViewController ()<UITextFieldDelegate>
- (IBAction)closeButtonClick:(id)sender;
- (IBAction)registerClick:(id)sender;
- (IBAction)forgetPasswordClick:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *userImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
    userImage.image=[UIImage imageNamed:@"usercenter_userdefaulticon.png"];
    _userTextField.leftViewMode=UITextFieldViewModeAlways;
    _userTextField.leftView=userImage;
    _userTextField.delegate=self;
    
    UIImageView *passImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
    passImage.image=[UIImage imageNamed:@"theCar_imgIcon.png"];
    _passwordTextField.leftViewMode=UITextFieldViewModeAlways;
    _passwordTextField.leftView=passImage;
    _passwordTextField.delegate=self;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_userTextField resignFirstResponder];
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

-(void)viewDidAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=YES;
}

- (IBAction)closeButtonClick:(id)sender
{
//    PersonViewController *personViewController=[[PersonViewController alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)registerClick:(id)sender
{
    RegisterViewController *registerViewController=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

- (IBAction)forgetPasswordClick:(id)sender
{
    ForgetPasswordViewController *forgetPasswordViewController=[[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgetPasswordViewController animated:YES];
    
    
}
- (IBAction)LoginButtonClick:(id)sender
{
    NSString *urlString=[NSString stringWithFormat:@"http://1000phone.net:8088/qfapp/index.php/juba/index/do_login?username=%@&password=%@",_userTextField.text,_passwordTextField.text];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        if (![dict[@"message"]isEqualToString:@"登录成功!"]) {
            NSLog(@"nnnnnn");
            UIAlertView *alter=[[UIAlertView alloc]init];
            alter.message=dict[@"message"];
            [alter addButtonWithTitle:@"确定"];
            [alter addButtonWithTitle:@"取消"];
            [alter show];
            
            
        }
        else
        {
           
           
            //self.tabBarController.tabBar.hidden=NO;
            NSLog(@"uuuuuuu");
            
            //NSUserDefaults将数据保存到本地沙盒，保存的数据必须以字典的形式
            NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
            
            //这句意思是data字典中username这个key值所对应的value
            [userDefaults setObject:dict[@"data"][@"username"] forKey:@"username"];
            [userDefaults setObject:dict[@"data"][@"token"] forKey:@"token"];
            
            //这句可以理解为保存数据
            [userDefaults synchronize];
            
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"验证码失败");
    }];
    
}
@end
