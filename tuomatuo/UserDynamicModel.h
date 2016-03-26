//
//  UserDynamicModel.h
//  tuomatuo
//
//  Created by xjk on 3/16/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDynamicModel : NSObject

@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *sex;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSNumber *seeSum;

@property (nonatomic, strong) NSMutableArray *imgURL;
@property (nonatomic, strong) NSNumber *loveSum;
@property (nonatomic, strong) NSNumber *messageSum;

@end
