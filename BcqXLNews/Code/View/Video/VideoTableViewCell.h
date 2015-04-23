//
//  VideoTableViewCell.h
//  BcqXLNews
//
//  Created by qianfeng on 15-3-23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoTableViewCell : UITableViewCell

@property (strong,nonatomic) UILabel *titleLabel;
@property (retain,nonatomic) UILabel *play_numLabel;
@property (strong,nonatomic) UIImageView *picImage;

@end
