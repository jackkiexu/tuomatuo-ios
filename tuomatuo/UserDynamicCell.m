//
//  UserDynamicCell.m
//  tuomatuo
//
//  Created by xjk on 1/18/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "UserDynamicCell.h"
#import "UserEntity.h"


@interface UserDynamicCell()
@property (nonatomic, strong) BaseView *baseView;
@property (nonatomic, strong) UIImageView *avatarImgView;
@property (nonatomic, strong) UILabel *userNameLab;
@end

@implementation UserDynamicCell

- (void)setUserDynamicEntity:(UserEntity *)userEntity{
    _userEntity = userEntity;
    
}

@end
