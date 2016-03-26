//
//  DynamicCell.m
//  tuomatuo
//
//  Created by xjk on 3/16/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "DynamicCell.h"

@interface DynamicCell()

@property (nonatomic, strong) UIImageView *avatarImg;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UIImageView *roundImg;
@property (nonatomic, strong) UIImageView *sexImg;
@property (nonatomic, strong) UILabel *sexNumLab;

@property (nonatomic, strong) UILabel *seeTotalNumLab;
@property (nonatomic, strong) UILabel *seeTotalLab;

@property (nonatomic, strong) UILabel *dynaTitalLab;
@property (nonatomic, strong) UIView *imgs;

@property (nonatomic, strong) UIButton *loveBtn;
@property (nonatomic, strong) UILabel *loveSumLab;
@property (nonatomic, strong) UIButton *msgBtn;
@property (nonatomic, strong) UILabel *msgSumLab;
@property (nonatomic, strong) UIButton *forwardBtn;

@end

@implementation DynamicCell

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
    
    [self addSubview:self.avatarImg];
    [self.avatarImg makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.top.equalTo(self).offset(7.7);
        make.width.height.equalTo(37);
    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(57.5);
        make.top.equalTo(self).offset(8.7);
        make.width.equalTo(49);
        make.height.equalTo(16);
    }];
    
    [self addSubview:self.seeTotalLab];
    [self.seeTotalLab makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-18);
        make.top.equalTo(self).offset(33);
        make.width.equalTo(18);
        make.height.equalTo(9);
    }];
    
    [self addSubview:self.seeTotalNumLab];
    [self.seeTotalNumLab makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-18);
        make.top.equalTo(self).offset(17);
        make.width.equalTo(47);
        make.height.equalTo(12);
    }];
    
    [self addSubview:self.dynaTitalLab];
    [self.dynaTitalLab makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(58);
        make.top.equalTo(self).offset(55);
        make.width.equalTo(357);
        make.height.equalTo(44);
    }];
    
}


- (UIImageView *)avatarImg{
    if(!_avatarImg){
//        _avatarImg = [[UIImageView alloc] initWithFrame:CGRectMake(, 7, 42, 42)];
        _avatarImg = [UIImageView new];
        _avatarImg.layer.masksToBounds = YES;
        _avatarImg.layer.cornerRadius = 18.5*PERCENT_HEIGH;
        _avatarImg.layer.borderColor = [UIColor colorWithRed:234/255.0 green:144/255.0 blue:144/255.0 alpha:1.0].CGColor;
        _avatarImg.layer.borderWidth = 1;
        
        
        NSURL *URL = [NSURL URLWithString:@"http://7u2k3q.com2.z0.glb.qiniucdn.com/avatar/4/5/4/1/131454.jpeg?imageMogr2/auto-orient/crop/!480x480a75a39/thumbnail/148x148/1457963931"];
        [_avatarImg sd_setImageWithURL:URL];
        
        
        _avatarImg.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapAvatar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAvatarImageView)];
        [_avatarImg addGestureRecognizer:tapAvatar];
    }
    return _avatarImg;
}
- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [UILabel new];
        _nameLab.text = @"邓旺旺";
        _nameLab.font = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
        _nameLab.textColor = [UIColor colorWithRed:116/255.0 green:126/255.0 blue:137/255.0 alpha:1.0];
        
    }
    return _nameLab;
}
- (UIImageView *)roundImg{
    if (!_roundImg) {
        _roundImg = [UIImageView new];
    }
    return _roundImg;
}
- (UIImageView *)sexImg{
    if (!_sexImg) {
        _sexImg = [UIImageView new];
    }
    return _sexImg;
}
- (UILabel *)sexNumLab{
    if (!_sexNumLab) {
        _sexNumLab = [UILabel new];
    }
    return _sexNumLab;
}


- (UILabel *)seeTotalLab{
    if (!_seeTotalLab) {
        _seeTotalLab = [UILabel new];
        _seeTotalLab.text = @"观看";
        _seeTotalLab.font = [UIFont fontWithName:FontName size:9];
        _seeTotalLab.textColor = [UIColor colorWithRed:177/255.0 green:173/255.0 blue:173/255.0 alpha:1.0];
    }
    return _seeTotalLab;
}
- (UILabel *)seeTotalNumLab{
    if (!_seeTotalNumLab) {
        _seeTotalNumLab = [UILabel new];
        _seeTotalNumLab.text = @"1.204.27";
        _seeTotalNumLab.font = [UIFont fontWithName:FontName size:12];
        _seeTotalNumLab.textColor = [UIColor colorWithRed:116/255.0 green:126/255.0 blue:137/255.0 alpha:1.0];
    }
    return _seeTotalNumLab;
}


- (UILabel *)dynaTitalLab{
    if (!_dynaTitalLab) {
        _dynaTitalLab = [UILabel new];
        _dynaTitalLab.text = @"朴树周迅分手的原因?";
        _dynaTitalLab.font = [UIFont fontWithName:FontName size:16];
        _dynaTitalLab.textColor = [UIColor colorWithRed:102/255.0 green:94/255.0 blue:94/255.0 alpha:1.0];
        
    }
    return _dynaTitalLab;
}
- (UIView *)imgs{
    if (!_imgs) {
        _imgs = [UIView new];
    }
    return _imgs;
}


- (UIButton *)loveBtn{
    if (!_loveBtn) {
        _loveBtn = [UIButton new];
    }
    return _loveBtn;
}
- (UILabel *)loveSumLab{
    if (!_loveSumLab) {
        _loveSumLab = [UILabel new];
    }
    return _loveSumLab;
}
- (UIButton *)msgBtn{
    if (!_msgBtn) {
        _msgBtn = [UIButton new];
    }
    return _msgBtn;
}
- (UILabel *)msgSumLab{
    if (!_msgSumLab) {
        _msgSumLab = [UILabel new];
    }
    return _msgSumLab;
}
- (UIButton *)forwardBtn{
    if (!_forwardBtn) {
        _forwardBtn = [UIButton new];
    }
    return _forwardBtn;
}


@end
