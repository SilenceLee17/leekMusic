//
//  LXDEngine.h
//  music
//
//  Created by lixingdong on 15/9/8.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef void (^SuccessBlock)(NSInteger statusCode, NSDictionary *dict);
typedef void (^FailureBlock)(NSInteger statusCode, NSError *error);
@interface LXDEngine : NSObject
+(LXDEngine *)sharedEngine;
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(SuccessBlock)success
        faliure:(FailureBlock)failure;
- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(SuccessBlock)success
         faliure:(FailureBlock)failure;
- (AFHTTPRequestOperation *)uploadFile:(NSString *)fileName
                          withMimeType:(NSString *)mimeType
                                AtPath:(NSString *)path
                            parameters:(NSDictionary *)parameters
                   uploadProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block
                               success:(SuccessBlock)success
                               faliure:(FailureBlock)failure;
@end
