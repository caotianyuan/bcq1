//
//  VideoTableViewCell.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "VideoTableViewCell.h"
#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)

@implementation VideoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //        NSLog(@"123");
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    _picImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, (kScreenHeight-65)/2*0.75)];
    //_picImage.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:_picImage];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(1.0/32*kScreenWidth, (kScreenHeight-65)/2*0.75+1.0/48*kScreenHeight, 20.0/32*kScreenWidth, (kScreenHeight-65)/2*0.25-1.0/48*kScreenHeight)];
    //_titleLabel.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:_titleLabel];
    
    _play_numLabel=[[UILabel alloc]initWithFrame:CGRectMake(2.0/32*kScreenWidth+20.0/32*kScreenWidth, (kScreenHeight-65)/2*0.75+1.0/48*kScreenHeight, 8.0/32*kScreenWidth, (kScreenHeight-65)/2*0.25-1.0/48*kScreenHeight)];
    //_play_numLabel.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:_play_numLabel];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
