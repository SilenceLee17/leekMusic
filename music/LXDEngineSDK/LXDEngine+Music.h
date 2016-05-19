//
//  LXDEngine+Music.h
//  music
//
//  Created by lixingdong on 15/9/10.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDEngine.h"
#import "LXDMusic.h"
#import "LXDSong.h"
@interface LXDEngine (Music)
-(void)getSearchListWithKeyWord:(NSString *) keyWord
                        success:(void (^)(LXDMusic *musicSearch))success
                        failure:(FailureBlock)failure;
-(void)getSongWithHash:(NSString *) hash
                        success:(void (^)(LXDSong *song))success
                        failure:(FailureBlock)failure;
@end
