//
//  PictureView.h
//  BcqXLNews
//
//  Created by qianfeng on 15-3-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureModel.h"


@interface PictureView : UIView


@property (copy,nonatomic) void (^pushView)(PictureModel* model);

@end
