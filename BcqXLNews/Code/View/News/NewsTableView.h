//
//  NewsTableView.h
//  BcqXLNews
//
//  Created by qianfeng on 15-3-20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsTableView : UIView

@property (copy ,nonatomic) NSString *urlString;

@property (strong,nonatomic) NewsModel *model;
- (void)setUrlStringAddReload:(NSString *)urlString;

@property (copy,nonatomic) void (^pushView)(NewsModel* model);
@end
