//
//  MusicBackgroundView.m
//  music
//
//  Created by 李兴东 on 16/5/22.
//  Copyright © 2016年 leek. All rights reserved.
//

#import "MusicBackgroundView.h"

@implementation MusicBackgroundView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setNeedsDisplay];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context=UIGraphicsGetCurrentContext();//设置一个空白view，准备画画

    UIBezierPath* aPath = [UIBezierPath bezierPath];

    // 绘制颜色渐变
    // 创建色彩空间对象
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    // 创建起点颜色
    CGColorRef endColor = CGColorCreate(colorSpaceRef, (CGFloat[]){1, 200/255.0, 200/255.0, 1.0f});


    // 创建终点颜色
    CGColorRef beginColor =  CGColorCreate(colorSpaceRef, (CGFloat[]){1, 1, 1, 1.0f});


    // 创建颜色数组
    CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor, endColor}, 2, nil);
    // 创建渐变对象
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, colorArray, (CGFloat[]){
        0.0f,	   // 对应起点颜色位置
        1.0f,		// 对应终点颜色位置
    });
    // 释放颜色数组
    CFRelease(colorArray);
    // 释放起点和终点颜色
    CGColorRelease(beginColor);
    CGColorRelease(endColor);
    // 释放色彩空间
    CGColorSpaceRelease(colorSpaceRef);
    CGFloat x1 = [UIScreen mainScreen].bounds.size.width;
    CGFloat y1 = [UIScreen mainScreen].bounds.size.height;
    CGPoint centerPoint = CGPointMake(x1/2, y1/2);;
    CGContextDrawRadialGradient(context, gradientRef, centerPoint, 0, centerPoint, MAX(x1, y1), 0);

    // 释放渐变对象
    CGGradientRelease(gradientRef);


    UIColor *color = [UIColor colorWithRed:1 green:220/255.0 blue:220/255.0 alpha:1];
    [color set]; //设置线条颜色

    int i, j;
    double x, y, r;
    for (i = 0; i <= 90; i++){
        for (j = 0; j <= 90; j++) {
            r = M_PI / 45 * i * (1 - sin(M_PI / 45 * j)) * 18;
            x = r * cos(M_PI / 45 * j) * sin(M_PI / 45 * i)
            + [UIScreen mainScreen].bounds.size.width / 2;
            y = -r * sin(M_PI / 45 * j) + [UIScreen mainScreen].bounds.size.height / 4;
            if (i == 0 && j == 0) {
                [aPath moveToPoint:CGPointMake(x, y)];
            }else{
                [aPath addLineToPoint:CGPointMake(x, y)];
            }
        }
    }
    aPath.lineWidth = 0.5;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    [aPath closePath];
    [aPath stroke];
}
@end
