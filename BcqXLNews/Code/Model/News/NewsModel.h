//
//  NewsModel.h
//  BcqXLNews
//
//  Created by qianfeng on 15-3-17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic) int comment_total;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *descript;
@property (strong,nonatomic) NSString *content;
@property (strong,nonatomic) NSString *cover_pic;

@end

@interface NewsModel2 : NSObject


@property (copy,nonatomic) NSString *id1;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *cover_pic;


@end
