//
//  MusicBaseViewController.m
//  music
//
//  Created by lixingdong on 15/9/9.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "MusicBaseViewController.h"

@implementation MusicBaseViewController
- (void)viewDidLoad
{
    [super viewDidLoad];

    // 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 25, 25);
    [backButton setBackgroundImage:[UIImage imageNamed:@"topBack"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)doBack:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
