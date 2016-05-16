//
//  LXDBaseModel.m
//  music
//
//  Created by lixingdong on 15/9/8.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDBaseModel.h"

@implementation LXDBaseModel
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
