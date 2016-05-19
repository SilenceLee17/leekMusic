//
//  LXDMusicInfo.h
//  music
//
//  Created by 李兴东 on 16/5/17.
//  Copyright © 2016年 leek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXDMusicInfo : NSObject
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) NSString *songname;
@property (nonatomic, assign) NSInteger m4afilesize;
@property (nonatomic, strong) NSString *info320hash;
@property (nonatomic, strong) NSString *mvhash;
@property (nonatomic, assign) NSInteger privilege;
@property (nonatomic, assign) NSInteger filesize;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) NSInteger bitrate;
@property (nonatomic, copy) NSArray *group;
@property (nonatomic, strong) NSString *album_name;
@property (nonatomic, strong) NSString *topic;
@property (nonatomic, assign) NSInteger info320filesize;
@property (nonatomic, assign) NSInteger isnew;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, strong) NSString *album_id;
@property (nonatomic, assign) NSInteger Accompany;
@property (nonatomic, strong) NSString *singername;
@property (nonatomic, strong) NSString *extname;
@property (nonatomic, assign) NSInteger info320privilege;
@property (nonatomic, assign) NSInteger sourceid;
@property (nonatomic, assign) NSInteger srctype;
@property (nonatomic, assign) NSInteger feetype;
@property (nonatomic, assign) NSInteger sqfilesize;
@property (nonatomic, strong) NSString *infoHash;
@property (nonatomic, assign) NSInteger sqprivilege;
@property (nonatomic, strong) NSString *sqhash;
@property (nonatomic, strong) NSString *othername;
@end
