//
//  MusicPlayController.m
//  music
//
//  Created by 李兴东 on 16/5/21.
//  Copyright © 2016年 leek. All rights reserved.
//

#import "MusicPlayController.h"

@implementation MusicPlayController
-(instancetype)init{
    self = [super init];
    if (self) {
        [self loadSubviews];
    }
    return self;
}
-(void)loadSubviews{
    UIView *playView = [[UIView alloc] init];
    playView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:playView];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultHead"]];
    [playView addSubview:imageView];

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = @"你就不要想起我";
    [playView addSubview:titleLabel];

    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
    descriptionLabel.textAlignment = NSTextAlignmentLeft;
    descriptionLabel.font = [UIFont systemFontOfSize:12];
    descriptionLabel.text = @"田馥甄";
    [playView addSubview:descriptionLabel];

    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton setImage:[UIImage imageNamed:@"playButton"] forState:UIControlStateNormal];
    [playView addSubview:playButton];

    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setImage:[UIImage imageNamed:@"nextButton"] forState:UIControlStateNormal];
    [playView addSubview:nextButton];


    [playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];

    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(playView);
        make.centerY.equalTo(playView);
        make.size.equalTo(50);
    }];

    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(10);
        make.top.equalTo(playView).offset(5);
        make.right.equalTo(playButton).offset(-10);
    }];

    [descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.right.equalTo(playButton).offset(-10);
    }];

    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(playView);
        make.size.equalTo(40);
        make.right.equalTo(playView).offset(-10);
    }];

    [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(playView);
        make.size.equalTo(40);
        make.right.equalTo(nextButton.mas_left).offset(-10);
    }];
    
}
@end
