//
//  CurrentUser.h
//  tuomatuo
//
//  Created by xjk on 1/13/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserEntity.h"

@interface CurrentUser : NSObject

@property (nonatomic, copy) NSNumber *userId;
@property (nonatomic, copy) UserEntity *userInfo;

+ (CurrentUser *)Instance;
- (BOOL)isLogin;
- (BOOL)hasClientToken;
- (BOOL)updateCurrentUserInfoIfNeeded;
- (void)saveUser:(UserEntity *)user;
- (void)setUpClientRequestState:(BaseResultBlock)block;
- (void)logOut;
- (NSString *)userLabel;

@end
