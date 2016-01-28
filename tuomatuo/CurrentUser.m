//
//  CurrentUser.m
//  tuomatuo
//
//  Created by xjk on 1/13/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "CurrentUser.h"

@implementation CurrentUser
+ (CurrentUser *)Instance {
    static dispatch_once_t once;
    static CurrentUser *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[CurrentUser alloc] init];
    });
    return sharedInstance;
}

- (BOOL)isLogin {
    return (self.userId && self.userId.intValue > 0);
}

- (BOOL)hasClientToken {
    return YES;
}

- (void)saveUser:(UserEntity *)user {

}

- (void)updateCurrentUserInfoIfNeeded {
}

- (NSNumber *)userId {
    return 0;
}

- (UserEntity *)userInfo {
    if (!self.userId) return nil;
    
    return nil;
}

- (void)setupClientRequestState:(BaseResultBlock)block {
}

- (void)checkNoticeCount {
    if ([[CurrentUser Instance] isLogin]) {

    }
}

- (void)logOut {

}

- (NSString *)userLabel {
    return self.isLogin ? [NSString stringWithFormat:@"user_%@_%@", [CurrentUser Instance].userId, [[CurrentUser Instance] userInfo].username] : @"non-logged-in";
}
@end
