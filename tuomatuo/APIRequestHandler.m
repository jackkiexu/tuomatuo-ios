//
//  APIRequestHandler.m
//  tuomatuo
//
//  Created by xjk on 1/11/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "APIRequestHandler.h"
#import "AFURLSessionManager.h"

@implementation APIRequestHandler

- (void)registerNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkRequestDidStart:) name:AFNetworkingOperationDidStartNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkRequestDidFinish:) name:AFNetworkingOperationDidFinishNotification object:nil];
    
#if (defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000) || (defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && __MAC_OS_X_VERSION_MAX_ALLOWED >= 1090)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkRequestDidStart:) name:AFNetworkingTaskDidResumeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkRequestDidStart:) name:AFNetworkingTaskDidCompleteNotification object:nil];
    
#endif
}



- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
