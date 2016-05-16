//
//  LXDMusicSong.h
//  music
//
//  Created by lixingdong on 15/9/18.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDBaseModel.h"
#import "DOUAudioFile.h"
@interface LXDMusicSongInfo : LXDBaseModel <DOUAudioFile>
@property(nonatomic,strong)NSString *fileHead;
@property(nonatomic,strong)NSString *q;
@property(nonatomic,strong)NSString *fileSize;
@property(nonatomic,strong)NSString *fileName;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *extName;
@property(nonatomic,strong)NSString *bitRate;
@property(nonatomic,strong)NSString *timeLength;
@property (nonatomic, strong) NSURL *audioFileURL;
@end
