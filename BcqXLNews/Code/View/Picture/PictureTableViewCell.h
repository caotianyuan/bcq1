//
//  PictureTableViewCell.h
//  BcqXLNews
//
//  Created by qianfeng on 15-3-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureTableViewCell : UITableViewCell

@property (strong,nonatomic) UIImageView *images1;
@property (strong,nonatomic) UIImageView *images2;
@property (strong,nonatomic) UIImageView *images3;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) NSArray *pic_listArray;
@property (strong,nonatomic) UILabel *descriptLabel;


@end
