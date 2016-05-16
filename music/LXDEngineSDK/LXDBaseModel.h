//
//  LXDBaseModel.h
//  music
//
//  Created by lixingdong on 15/9/8.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXDBaseModel : NSObject
@property(nonatomic,assign)NSInteger error;
@property(nonatomic,copy)NSString *errcode;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
