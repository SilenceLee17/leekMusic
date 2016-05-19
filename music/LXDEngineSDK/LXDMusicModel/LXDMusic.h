//
//  LXDMusic.h
//  music
//
//  Created by 李兴东 on 16/5/17.
//  Copyright © 2016年 leek. All rights reserved.
//

#import "LXDMusicData.h"

@interface LXDMusic : NSObject
@property (nonatomic, strong) NSString *error;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) NSInteger errcode;
@property (nonatomic, strong) LXDMusicData *data;
@end
