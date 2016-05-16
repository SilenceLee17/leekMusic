//
//  LXDEngine.m
//  music
//
//  Created by lixingdong on 15/9/8.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "LXDEngine.h"
#import "AFNetworking.h"
#define TIMEOUT_INTERVAL        10
#define UPLOAD_TIMEOUT          40
#define BASE_URL @"http://ioscdn.kugou.com"
@interface LXDEngine ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *httpManager;

@end

@implementation LXDEngine
+(LXDEngine *)sharedEngine{
    static LXDEngine *sharedEngineInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedEngineInstance = [[self alloc] init];
    });
    return sharedEngineInstance;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.httpManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        //    添加头文件
        //     NSString *ua = [[NSString alloc] initWithFormat:@"ios/%@", APP_VERSION];
        //    [self.httpManager.requestSerializer setValue:ua forHTTPHeaderField:@"app"];
        ((AFJSONResponseSerializer *)self.httpManager.responseSerializer).removesKeysWithNullValues = YES;
        self.httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }
    return self;
}
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(SuccessBlock)success
        faliure:(FailureBlock)failure{
    self.httpManager.requestSerializer.timeoutInterval = TIMEOUT_INTERVAL;
    NSString *escapedPath = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.httpManager GET:escapedPath parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([[operation response] statusCode], responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure([[operation response] statusCode], error);
    }];

}
- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(SuccessBlock)success
         faliure:(FailureBlock)failure{
    self.httpManager.requestSerializer.timeoutInterval = TIMEOUT_INTERVAL;
    NSString *escapedPath = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.httpManager POST:escapedPath parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([[operation response] statusCode], responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure([[operation response] statusCode], error);
    }];
}

- (AFHTTPRequestOperation *)uploadFile:(NSString *)fileName
                          withMimeType:(NSString *)mimeType
                                AtPath:(NSString *)path
                            parameters:(NSDictionary *)parameters
                   uploadProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block
                               success:(SuccessBlock)success
                               faliure:(FailureBlock)failure
{
    self.httpManager.requestSerializer.timeoutInterval = UPLOAD_TIMEOUT;
    NSString *escapedPath = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithContentsOfFile:fileName];
    AFHTTPRequestOperation *operation = [self.httpManager POST:escapedPath parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSInputStream *inputStream = [NSInputStream inputStreamWithData:data];
        [formData appendPartWithInputStream:inputStream name:@"file" fileName:fileName length:data.length mimeType:mimeType];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([[operation response] statusCode], responseObject);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        failure([[operation response] statusCode], error);
    }];
    [operation setUploadProgressBlock:block];
    return operation;
}
@end
