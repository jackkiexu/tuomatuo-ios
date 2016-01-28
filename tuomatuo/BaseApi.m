//
//  BaseApi.m
//  tuomatuo
//
//  Created by xjk on 1/11/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "BaseApi.h"

@implementation BaseApi

+ (instancetype)loginTokenGrantInstance {
    static BaseApi *_passwordGrantInstance = nil;
    static dispatch_once_t passwordGrantOnceToken;
    dispatch_once(&passwordGrantOnceToken, ^{
        _passwordGrantInstance = [[BaseApi alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURL]];
        [_passwordGrantInstance prepareForCommonRequest];
        [_passwordGrantInstance setUpLoginTokenGrantRequest];
    });
    return _passwordGrantInstance;
}

+ (instancetype)clientGrantInstance{
    static BaseApi *_clientGrantInstance = nil;
    
    return _clientGrantInstance;
}

#pragma mark - Helper
- (void)prepareForCommonRequest{
    
}

- (void)setUpClientGrantRequest{
    
}

- (void)setUpLoginTokenGrantRequest{
    
}

#pragma mark - Abstract Method
- (id)create:(id)entity withBlock:(BaseResultBlock)block{
    NSLog(@"You must override %@ in a subclass", NSStringFromSelector(_cmd));
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)update:(id)entity withBlock:(BaseResultBlock)block{
    NSLog(@"You must override %@ in a subclass", NSStringFromSelector(_cmd));
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)upvote:(id)entity withBlock:(BaseResultBlock)block{
    NSLog(@"You must override %@ in a subclass", NSStringFromSelector(_cmd));
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
