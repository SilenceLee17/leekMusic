//
//  NSString+MD5.h
//  music
//
//  Created by lixingdong on 15/9/18.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
+(NSString *)md5HexDigest:(NSString*)input;
@end
