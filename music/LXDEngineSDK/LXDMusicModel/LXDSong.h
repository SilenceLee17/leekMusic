//
//  LXDSong.h
//  music
//
//  Created by 李兴东 on 16/5/19.
//  Copyright © 2016年 leek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUAudioFile.h"
@interface LXDSong : NSObject<DOUAudioFile>
@property (nonatomic, strong) NSString *fileHead;
@property (nonatomic, assign) NSInteger q;
@property (nonatomic, assign) NSInteger fileSize;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *extName;
@property (nonatomic, assign) NSInteger bitRate;
@property (nonatomic, assign) NSInteger timeLength;
@property (nonatomic, strong) NSURL *audioFileURL;
;
- (NSURL *)audioFileURL;
@end
