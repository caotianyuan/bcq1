//
//  AppDelegate.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsViewController.h"
#import "PictureViewController.h"
#import "VideoViewController.h"
#import "PersonViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    NewsViewController *newsViewController=[[NewsViewController alloc]initWithNibName:@"NewsViewController" bundle:nil];
    UINavigationController *newsNavigationController=[[UINavigationController alloc]initWithRootViewController:newsViewController];
    newsViewController.title=@"新闻";
    newsViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_news"];
    
    
    
//    PictureViewController *pictureViewController=[[PictureViewController alloc]initWithNibName:@"PictureViewController" bundle:nil];
    PictureViewController *pictureViewController=[[PictureViewController alloc]init];
    UINavigationController *pictureNavigationController=[[UINavigationController alloc]initWithRootViewController:pictureViewController];
    pictureViewController.title=@"图片";
    pictureViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_picture"];
    
    
    VideoViewController *videoViewController=[[VideoViewController alloc]initWithNibName:@"VideoViewController" bundle:nil];
    UINavigationController *videoNavigationController=[[UINavigationController alloc]initWithRootViewController:videoViewController];
    videoViewController.title=@"视频";
    videoViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_video"];
    
    PersonViewController *personViewController=[[PersonViewController alloc]init];
    UINavigationController *personNavigationController=[[UINavigationController alloc]initWithRootViewController:personViewController];
    personViewController.title=@"我的";
    personViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_setting"];
    
    UITabBarController *MainTabBarController=[[UITabBarController alloc]init];
    MainTabBarController.viewControllers=@[newsNavigationController,pictureNavigationController,videoNavigationController,personNavigationController];
    self.window.rootViewController=MainTabBarController;
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
