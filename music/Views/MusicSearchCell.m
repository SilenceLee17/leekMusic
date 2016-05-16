//
//  MusicSearchCell.m
//  music
//
//  Created by lixingdong on 15/9/9.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "MusicSearchCell.h"
#import "UIFont+Music.h"
#import "UIColor+Music.h"
@interface MusicSearchCell ()
@property(nonatomic,strong)UILabel *nameLabel;
@end

@implementation MusicSearchCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellAccessoryNone;
        [self setupSubviews];
    }
    return self;
}
-(void)setupSubviews{
    _nameLabel=UILabel.new;
    _nameLabel.font = [UIFont defaultFontOfSize:15];
    _nameLabel.textColor = [UIColor redColor];
    _nameLabel.backgroundColor = [UIColor clearColor];
    [_nameLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.contentView addSubview:_nameLabel];

    UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator"]];
    arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:arrowImageView];

    __typeof(self) __weak weakSelf = self;

    [_nameLabel makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(weakSelf).offset(15);
        make.top.equalTo(weakSelf).offset(20);
        make.bottom.equalTo(weakSelf).offset(-20).priorityLow();
    }];
    [arrowImageView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(weakSelf).offset(-15);
        make.top.equalTo(weakSelf).offset(20);
        make.bottom.equalTo(weakSelf).offset(-20).priorityLow();
    }];

}
-(void)setName:(NSString *)name{
    _nameLabel.text = name;
}
@end
