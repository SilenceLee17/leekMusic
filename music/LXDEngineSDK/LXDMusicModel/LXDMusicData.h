//
//  LXDMusicData.h
//  music
//
//  Created by 李兴东 on 16/5/17.
//  Copyright © 2016年 leek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXDMusicInfo.h"

@interface LXDMusicData : NSObject
@property (nonatomic, assign) NSUInteger timestamp;
@property (nonatomic, assign) NSInteger correctiontype;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger istag;
@property (nonatomic, strong) NSString *correctiontip;
@property (nonatomic, assign) NSInteger forcecorrection;
@property (nonatomic, assign) NSInteger istagresult;
@property (nonatomic, copy)   NSArray<LXDMusicInfo *> *info;
@end
