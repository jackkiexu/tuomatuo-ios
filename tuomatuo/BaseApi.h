//
//  BaseApi.h
//  tuomatuo
//
//  Created by xjk on 1/11/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "APIRequestHandler.h"

typedef void (^ BaseResultBlock)(id data, NSError *error);
typedef void (^ BaseRequestSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^ BaseRequestFailureBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void (^ BaseRequestConstructingBodyBlock)(id<AFMultipartFormData> formData);

@interface BaseApi : AFHTTPSessionManager

@property (strong, nonatomic) APIRequestHandler *handler;

#pragma mark - Share Instance
+ (instancetype)loginTokenGrantInstance;
+ (instancetype)clientGrantInstance;

#pragma mark - Public Method
- (void)setUpLoginTokenGrantRequest;
- (void)setUpClientGrantRequest;

#pragma mark - Share/Inherit Method
- (id)create:(id)entity withBlock:(BaseResultBlock)block;
- (id)update:(id)entity withBlock:(BaseResultBlock)block;
- (id)upvote:(id)entity withBlock:(BaseResultBlock)block;

@end
