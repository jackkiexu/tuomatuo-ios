//
//  FriendsModel.h
//  tuomatuo
//
//  Created by xjk on 2/24/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "JSONModel.h"

@interface FriendsModel : JSONModel

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *friendId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSNumber *sex;
@property (nonatomic, strong) NSNumber *fansNum;
@property (nonatomic, strong) NSString *avatarUrl;

@end
