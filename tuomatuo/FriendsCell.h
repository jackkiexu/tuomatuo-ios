//
//  FriendsCell.h
//  tuomatuo
//
//  Created by xjk on 2/24/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsModel;

@interface FriendsCell : UITableViewCell

@property (strong, nonatomic) UIImageView *avatarImgView;
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UILabel *fansNum;

- (void)setFriendMobile:(FriendsModel *)friendMobile;

@end
