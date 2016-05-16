//
//  LXDMusicSong.m
//  music
//
//  Created by lixingdong on 15/9/18.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDMusicSongInfo.h"

@implementation LXDMusicSongInfo
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"url"]) {
        self.audioFileURL=[NSURL URLWithString:value];
    }else{
        [super setValue:value forKey:key];
    }
}
@end
