//
//  MusicEngine.h
//  music
//
//  Created by 李兴东 on 15/9/21.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUAudioStreamer.h"
@interface MusicEngine : NSObject
@property(nonatomic,strong)DOUAudioStreamer *streamer;
+(MusicEngine *)sharedMusicEngine;
-(void)play:(id <DOUAudioFile>)audioFile;
-(BOOL)isPlaying;
-(void)setTimeByRatio:(CGFloat)ratio;

@end
