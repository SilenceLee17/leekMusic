//
//  MusicEngine.m
//  music
//
//  Created by 李兴东 on 15/9/21.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "MusicEngine.h"

@interface MusicEngine ()

@property(nonatomic,weak)id <DOUAudioFile> audioFile;
@end
@implementation MusicEngine
+(MusicEngine *)sharedMusicEngine{
    static MusicEngine *musicEngineInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        musicEngineInstance = [[self alloc] init];
    });
    return musicEngineInstance;
}
-(instancetype)init{
    self =[super init];
    if (self) {
        _streamer=[[DOUAudioStreamer alloc] init];
    }
    return self;
}
-(void)play:(id <DOUAudioFile>)audioFile{
    if (audioFile &&(!_audioFile || ![[_audioFile.audioFileURL absoluteString] isEqualToString:[audioFile.audioFileURL absoluteString]] )) {
        _audioFile=audioFile;
         _streamer=[[DOUAudioStreamer alloc] initWithAudioFile:_audioFile];
        [_streamer play];
    }else{
        [self changeStatus];
    }
    
}
- (void)changeStatus
{
    if ([_streamer status] == DOUAudioStreamerPaused ||
        [_streamer status] == DOUAudioStreamerIdle ||
        [_streamer status] == DOUAudioStreamerFinished) {
        [_streamer play];
    }
    else {
        [_streamer pause];
    }
}
-(BOOL)isPlaying{
    if ([_streamer status] == DOUAudioStreamerPaused ||
        [_streamer status] == DOUAudioStreamerIdle ||
        [_streamer status] == DOUAudioStreamerFinished) {
        return NO;
    }
    return YES;
}
-(void)setTimeByRatio:(CGFloat)ratio{
    if (ratio < 0 || ratio > 1) {
        NSLog(@"error ratio");
        return;
    }
     [_streamer setCurrentTime:[_streamer duration] * ratio];
}
@end
