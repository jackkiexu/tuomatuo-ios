//
//  FriendsCell.m
//  tuomatuo
//
//  Created by xjk on 2/24/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "FriendsCell.h"
#import "FriendsModel.h"

static CGFloat avatarHeight = 42;

@interface FriendsCell()

@property (strong, nonatomic) FriendsModel *friendsModel;

@end

@implementation FriendsCell

- (void)setFriendMobile:(FriendsModel *)friendMobile{
    _friendsModel = friendMobile;
    NSURL *URL = [BaseHelper qiniuImageCenter:_friendsModel.avatarUrl withWidth:@"76" withHeight:@"76"];
    URL = [NSURL URLWithString:@"http://7u2k3q.com2.z0.glb.qiniucdn.com/avatar/4/5/4/1/131454.jpeg?imageMogr2/auto-orient/crop/!480x480a75a39/thumbnail/148x148/1457963931"];
    [self.avatarImgView sd_setImageWithURL:URL];
    self.name.text = friendMobile.name;
    self.fansNum.text = [friendMobile.fansNum stringValue];
}

#pragma mark Tap User Avatar

- (void)didTapAvatarImageView {
    NSLog(@"didTapAvatarImageView");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"gestureRecognizerShouldBegin");
    if ([[gestureRecognizer view] isKindOfClass:[UITableViewCell class]]) {
        return NO;
    }
    return YES;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    }
    return self;
}

- (void)layoutSubviews {
    
   CGFloat spaceOffset = 7*PERCENT_WIDTH;
    [self addSubview:self.avatarImgView];
    [self.avatarImgView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.top.equalTo(self).offset(7*PERCENT_HEIGH);
        make.width.height.equalTo(42*PERCENT_HEIGH);
    }];
    
    [self addSubview:self.name];
    [self.name makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImgView.right).offset(spaceOffset);
        make.top.equalTo(self).offset(13*PERCENT_HEIGH);
    }];
    
    [self addSubview:self.fansNum];
    [self.fansNum makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImgView.right).offset(spaceOffset);
        make.top.equalTo(self).offset(36*PERCENT_HEIGH);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:0.6];
    
    
    [self addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self);
        make.height.equalTo(0.5);
        make.bottom.equalTo(self);
    }];
}


- (UIImageView *)avatarImgView{
    if(!_avatarImgView){
        _avatarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 7, 42, 42)];
        _avatarImgView.layer.masksToBounds = YES;
        _avatarImgView.layer.cornerRadius = 21*PERCENT_HEIGH;
        _avatarImgView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapAvatar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAvatarImageView)];
        [_avatarImgView addGestureRecognizer:tapAvatar];
    }
    return _avatarImgView;
}

- (UILabel *)name{
    if (!_name) {
        _name = [UILabel new];
        _name.font = [UIFont fontWithName:FontName size:16];
        _name.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:104/255.0 alpha:1.0];
    }
    return _name;
}

- (UILabel *)fansNum{
    if (!_fansNum) {
        _fansNum = [UILabel new];
        _fansNum.font = [UIFont fontWithName:FontName size:9];
        _fansNum.textColor = [UIColor colorWithRed:116/255.0 green:126/255.0 blue:152/255.0 alpha:1.0];
    }
    return _fansNum;
}


@end
