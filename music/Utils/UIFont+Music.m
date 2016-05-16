//
//  UIFont+Account.m
//  iosOpenP
//
//  Created by dennis on 8/9/15.
//
//

#import "UIFont+Music.h"

/*
family:'FZLanTingKanHeiS-R-GB'
font:'FZLTKHJW--GB1-0'

family:'FZLanTingHeiS-R-GB'
font:'FZLTHJW--GB1-0'
*/

@implementation UIFont (Music)

+ (UIFont *)defaultFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)boldFontOfSize:(CGFloat)size
{
    return [UIFont boldSystemFontOfSize:size];
}

@end
