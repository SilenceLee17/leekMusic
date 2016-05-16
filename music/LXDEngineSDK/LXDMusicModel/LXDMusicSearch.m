//
//  LXDMusicSearch.m
//  music
//
//  Created by lixingdong on 15/9/14.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDMusicSearch.h"
#import "NSMutableArray+Music.h"
@implementation LXDMusicSong
//标识字段修改
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"320filesize"]){
        self.filesize320 = value;
    }
    else if([key isEqualToString:@"320hash"]){
        self.hash320 = value;
    }
    else if([key isEqualToString:@"320privilege"]){
        self.privilege320 = value;
    }
    else if([key isEqualToString:@"hash"]){
        self.musicHash = value;
    }else if([key isEqualToString:@"\"album_id\""]){
        self.album_id = value;
    }else if([key isEqualToString:@"\"album_name\""]){
        self.album_name = value;
    }
    else{
        [super setValue:value forKey:key];
    }
    
}

@end


@implementation LXDMusicSinger
@end

@implementation LXDMusicSearch
-(void) setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"black"]){
        self.isblock = [value objectForKey:@"isblock"];
        self.type = [value objectForKey:@"type"];
    }
    else if([key isEqualToString:@"data"]){
        self.correctiontip = [value objectForKey:@"correctiontip"];
        self.correctiontype = [value objectForKey:@"correctiontype"];
        self.forcecorrection = [value objectForKey:@"forcecorrection"];
        self.istag = [value objectForKey:@"istag"];
        self.istagresult = [value objectForKey:@"istagresult"];
        self.timestamp = [value objectForKey:@"timestamp"];
        self.total = [value objectForKey:@"total"];
        self.info = [NSMutableArray array];
        for(NSMutableDictionary *songDict in [value objectForKey:@"info"]){
            LXDMusicSong *song=[[LXDMusicSong alloc] initWithDictionary:songDict];
            [self.info lxd_addObject:song];
        }
    }
    else if([key isEqualToString:@"relative"]){
        self.priortype=[value objectForKey:@"priortype"];
        NSArray *arr=[value objectForKey:@"singer"];
        self.singer = [[LXDMusicSinger alloc] initWithDictionary:[arr firstObject]];
    }
}
@end
