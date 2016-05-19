//
//  LXDSong.m
//  music
//
//  Created by 李兴东 on 16/5/19.
//  Copyright © 2016年 leek. All rights reserved.
//

#import "LXDSong.h"

@implementation LXDSong


- (NSURL *)audioFileURL {
    return [[NSURL alloc] initWithString:self.url];
}
@end
