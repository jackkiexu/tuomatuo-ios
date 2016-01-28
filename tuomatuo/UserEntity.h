//
//  UserEntity.h
//  tuomatuo
//
//  Created by xjk on 1/12/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "BaseEntity.h"

@interface UserEntity : BaseEntity<MTLJSONSerializing>

@property (nonatomic, copy) NSNumber *userId;
@property (nonatomic, copy) NSString *githubURL;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSNumber *topicCount;
@property (nonatomic, copy) NSNumber *replyCount;
@property (nonatomic, copy) NSNumber *notificationCount;
@property (nonatomic, copy) NSString *twitterAccount;
@property (nonatomic, copy) NSString *blogURL;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, copy) NSString *githubName;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *repliesUrl;
@property (nonatomic, strong) NSDate *createdAtDate;
@property (nonatomic, strong) NSDate *updatedAtDate;

@end
