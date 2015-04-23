//
//  PictureModel.h
//  BcqXLNews
//
//  Created by qianfeng on 15-3-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PictureModel : NSObject
@property (copy,nonatomic) NSString *id;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *descript;
@property (copy,nonatomic) NSString *pic_total;
@property (copy,nonatomic) NSArray *pic_list;

@end
