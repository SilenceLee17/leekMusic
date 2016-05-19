//
//  LXDEngine+Music.m
//  music
//
//  Created by lixingdong on 15/9/10.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDEngine+Music.h"
#import "NSString+MD5.h"
@implementation LXDEngine (Music)
-(void)getSearchListWithKeyWord:(NSString *) keyWord
                        success:(void (^)(LXDMusic *musicSearch))success
                        failure:(FailureBlock)failure{

    NSDictionary *dic=@{@"keyword":keyWord,@"page":@1,@"pagesize":@30,@"showtype":@10,@"plat":@2,@"version":@7610,@"tag":@1,@"correct":@1,@"privilege":@1,@"sver":@4};
    [self getPath:@"http://ioscdn.kugou.com/api/v3/search/song?" parameters:dic
          success:^(NSInteger statusCode, NSDictionary *dict){

              if ([[dict objectForKey:@"status"] integerValue] != 0) {
                  [LXDMusicInfo mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                      return @{
                               @"info320hash":@"320hash",
                               @"info320filesize":@"320filesize",
                               @"info320privilege":@"320privilege",
                               @"infoHash":@"hash",
                               };
                  }];

                  LXDMusic *music = [LXDMusic mj_objectWithKeyValues:dict];
                  success(music);
              }else{
                    failure(statusCode,[dict objectForKey:@"error"]);
              }

    }
          faliure:^(NSInteger statusCode, NSError *error){
              failure(statusCode,error);
    }];
}
//http://trackercdn.kugou.com/i/v2/?cmd=25&pid=3&authType=1&hash=319e620da14e7721afdb95211d1571d1&key=f7d90b213864ac6c63b8c05d07b3233d&behavior=play&appid=1000&version=7610
//http://trackercdn.kugou.com/i/?cmd=4&hash={$Hash}&key={$md5($hash . "kgcloud")}&pid=1&forceDown=0&vip=1
-(void)getSongWithHash:(NSString *) hash
               success:(void (^)(LXDSong *song))success
               failure:(FailureBlock)failure{
    NSString *key=[NSString md5HexDigest:[NSString stringWithFormat:@"%@kgcloud",hash]];
     NSDictionary *dic=@{@"hash":hash,@"cmd":@4,@"pid":@1,@"forceDown":@0,@"key":key,@"vip":@1};
    [self getPath:@"http://trackercdn.kugou.com/i/?" parameters:dic
          success:^(NSInteger statusCode, NSDictionary *dict){
              if ([[dict objectForKey:@"status"] integerValue] != 0) {
                  LXDSong *song = [LXDSong mj_objectWithKeyValues:dict];
                  success(song);
              }else{
                  failure(statusCode,[dict objectForKey:@"error"]);
              }
          }
          faliure:^(NSInteger statusCode, NSError *error){
              failure(statusCode,error);
          }];
}
@end
