//
//  UserModel.m
//  tuomatuo
//
//  Created by xjk on 1/12/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)init{
    self = [super init];
    if (self) {
        _api = [[UserApi alloc] init];
    }
    return self;
}

- (id)getCurrentUserData:(BaseResultBlock)block{
    return nil;
}
- (id)getUserById:(NSNumber *)userId callBack:(BaseResultBlock)block{
    return nil;
}
- (id)loginWithUserName:(NSString *)username loginToken:(NSString *)loginToken block:(BaseResultBlock)block{
    return nil;
}
- (id)updateUserProfile:(UserEntity *)user withBlock:(BaseResultBlock)block{
    return nil;
}

@end
