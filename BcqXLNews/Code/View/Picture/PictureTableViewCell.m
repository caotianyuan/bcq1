//
//  PictureTableViewCell.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PictureTableViewCell.h"
#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)
@implementation PictureTableViewCell

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

/*
 @property (strong,nonatomic) UILabel *titleLabel;
 @property (strong,nonatomic) NSArray *pic_listArray;
 @property (strong,nonatomic) UILabel *descriptLabel;

 */
-(void)createUI
{
    _images1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*3/4*1/2)];
    //_images1.backgroundColor=[UIColor yellowColor];
    [self.contentView addSubview:_images1];
    
    _images2=[[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenHeight*3/4*1/2, kScreenWidth*1/2, kScreenHeight*3/4*1/4)];
    //_images2.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:_images2];
    
    _images3=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*1/2, kScreenHeight*3/4*1/2, kScreenWidth*1/2, kScreenHeight*3/4*1/4)];
    //_images3.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:_images3];
    
    
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(1.0/30*kScreenWidth, kScreenHeight*3/4*1/2+kScreenHeight*3/4*1/4, 14.0/15.0*kScreenWidth, kScreenHeight*3/4*1/8)];
    //NSLog(@"size==%f",kScreenHeight*3/4*1/2);
    _titleLabel.font=[UIFont systemFontOfSize:18];
    _titleLabel.textColor=[UIColor blackColor];
    //_titleLabel.backgroundColor=[UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    
    _descriptLabel=[[UILabel alloc]initWithFrame:CGRectMake(1.0/30*kScreenWidth,  kScreenHeight*3/4*1/2+kScreenHeight*3/4*1/4+kScreenHeight*3/4*1/8, 14.0/15*kScreenWidth,kScreenHeight*3/4*1/8)];
    _descriptLabel.font=[UIFont systemFontOfSize:14];
    //_descriptLabel.textColor=[UIColor blackColor];
    //_descriptLabel.backgroundColor=[UIColor cyanColor];
    [self.contentView addSubview:_descriptLabel];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
