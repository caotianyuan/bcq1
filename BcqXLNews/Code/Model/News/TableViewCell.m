//
//  TableViewCell.m
//  BcqXLNews
//
//  Created by qianfeng on 15-3-17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    /*
     @property (strong,nonatomic) UIImageView *cover_picImage;
     @property (strong,nonatomic) UILabel *titleLabel;
     @property (strong,nonatomic) UILabel *descriptLabel;
     */
    _cover_picImage=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100, 70)];
    [self.contentView addSubview:_cover_picImage];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(110, 5, 200, 30)];
    _titleLabel.text=@"123";
    _titleLabel.font=[UIFont systemFontOfSize:14];
    _titleLabel.textColor=[UIColor blackColor];
    [self.contentView addSubview:_titleLabel];
    
    _descriptLabel=[[UILabel alloc]initWithFrame:CGRectMake(110, 40, 200, 30)];
    _descriptLabel.textColor=[UIColor blackColor];
    _descriptLabel.font=[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_descriptLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
