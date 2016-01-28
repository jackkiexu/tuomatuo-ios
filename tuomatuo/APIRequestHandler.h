//
//  APIRequestHandler.h
//  tuomatuo
//
//  Created by xjk on 1/11/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIRequestHandler : NSObject

@property (nonatomic, copy) NSString *grantType;
- (void)registerNotifications;

@end
