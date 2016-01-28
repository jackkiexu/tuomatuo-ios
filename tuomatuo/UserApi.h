//
//  UserApi.h
//  tuomatuo
//
//  Created by xjk on 1/12/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "BaseApi.h"
#import "UserEntity.h"

@interface UserApi : BaseApi
- (id)getCurrentUserData:(BaseResultBlock)block;
- (id)getUserById:(NSNumber *)userId callBack:(BaseResultBlock)block;
- (id)loginWithUserName:(NSString *)username loginToken:(NSString *)loginToken block:(BaseResultBlock)block;
- (id)updateUserProfile:(UserEntity *)user withBlock:(BaseResultBlock)block;
@end
