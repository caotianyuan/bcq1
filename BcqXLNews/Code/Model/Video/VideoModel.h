//
//  VideoModel.h
//  BcqXLNews
//
//  Created by qianfeng on 15-3-23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *video_url;
@property (retain,nonatomic) NSNumber *play_num;
@property (strong,nonatomic) NSString *pic;


@end
