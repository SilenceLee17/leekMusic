//
//  MusicNavigationController.m
//  music
//
//  Created by lixingdong on 15/9/9.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "MusicNavigationController.h"
#import "UIColor+Music.h"
#import "UIFont+Music.h"
@interface MusicNavigationController ()

@end

@implementation MusicNavigationController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *img;
        if (iOS7) {
            img = [UIColor imageWithColor:[UIColor colorWithRed:215/255.0 green:0/255.0  blue:64/255.0  alpha:1] andSize:CGSizeMake(1, 50)];
        } else {
            img = [UIColor imageWithColor:[UIColor colorWithRed:215/255.0 green:0/255.0  blue:64/255.0  alpha:1] andSize:CGSizeMake(1, 44)];
        }
        [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setTitleTextAttributes:@{
                                                     NSForegroundColorAttributeName: [UIColor whiteColor],
                                                     NSFontAttributeName: [UIFont defaultFontOfSize:18],
                                                     }];

        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
    return self;
}

@end
