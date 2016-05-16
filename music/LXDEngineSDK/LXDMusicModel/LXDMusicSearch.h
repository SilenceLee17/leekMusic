//
//  LXDMusicSearch.h
//  music
//
//  Created by lixingdong on 15/9/14.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDBaseModel.h"

@interface LXDMusicSong : LXDBaseModel

@property(nonatomic,strong)NSString *songname;
@property(nonatomic,strong)NSString *filesize320;
@property(nonatomic,strong)NSString *hash320;
@property(nonatomic,strong)NSString *privilege320;
@property(nonatomic,strong)NSString *Accompany;
@property(nonatomic,strong)NSString *bitrate;
@property(nonatomic,strong)NSString *duration;
@property(nonatomic,strong)NSString *extname;
@property(nonatomic,strong)NSString *feetype;
@property(nonatomic,strong)NSString *filename;
@property(nonatomic,strong)NSString *filesize;
@property(nonatomic,strong)NSString *musicHash;
@property(nonatomic,strong)NSString *isnew;
@property(nonatomic,strong)NSString *m4afilesize;
@property(nonatomic,strong)NSString *mvhash;
@property(nonatomic,strong)NSString *timestamp;
@property(nonatomic,strong)NSString *ownercount;
@property(nonatomic,strong)NSString *privilege;
@property(nonatomic,strong)NSString *singername;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSString *sourceid;
@property(nonatomic,strong)NSString *sqfilesize;
@property(nonatomic,strong)NSString *sqhash;
@property(nonatomic,strong)NSString *sqprivilege;
@property(nonatomic,strong)NSString *srctype;
@property(nonatomic,strong)NSString *topic;
@property(nonatomic,strong)NSString *album_id;
@property(nonatomic,strong)NSString *album_name;
@property(nonatomic,strong)NSString *group;
@property(nonatomic,strong)NSString *othername;

@end
@interface LXDMusicSinger : LXDBaseModel
@property(nonatomic,strong)NSString *albumcount;
@property(nonatomic,strong)NSString *imgurl;
@property(nonatomic,strong)NSString *mvcount;
@property(nonatomic,strong)NSString *singerid;
@property(nonatomic,strong)NSString *singername;
@property(nonatomic,strong)NSString *songcount;
@end
@interface LXDMusicSearch : LXDBaseModel
@property(nonatomic,strong)NSString *isblock;
@property(nonatomic,strong)NSString *type;

@property(nonatomic,strong)NSString *correctiontip;
@property(nonatomic,strong)NSString *correctiontype;
@property(nonatomic,strong)NSString *forcecorrection;
@property(nonatomic,strong)NSMutableArray *info; // of LXDMusicSong
@property(nonatomic,strong)NSString *istag;
@property(nonatomic,strong)NSString *istagresult;
@property(nonatomic,strong)NSString *timestamp;
@property(nonatomic,strong)NSString *total;

@property(nonatomic,strong)NSString *priortype;
@property(nonatomic,strong)LXDMusicSinger *singer;

@property(nonatomic,strong)NSString *status;
@end
