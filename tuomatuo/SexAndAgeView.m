//
//  SexAndAgeView.m
//  tuomatuo
//
//  Created by xjk on 1/18/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "SexAndAgeView.h"

@interface SexAndAgeView()
@property (nonatomic, strong) UIImageView *sexImg;
@property (nonatomic, strong) UILabel *ageLab;
@end

@implementation SexAndAgeView

- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}


// 当外部调用init的方法的时候，其内部也会默默地调用initWithFrame
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, 31, 15)];
    NSLog(@"frame : %@, %@", NSStringFromCGRect(frame), [super class]);
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        if(_sex == 0){
            self.layer.borderColor = kRedColor.CGColor;
        }
        if(_sex == 1){
            self.layer.borderColor = kGrayColor.CGColor;
        }
        self.layer.cornerRadius = self.frame.size.height/2;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 1;
    }
    [self layoutSubviews];
    return self;
}

- (UIImageView *)sexImg{
    _sexImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 7, 8)];
    if(_sex == 0){
        [_sexImg setImage:[UIImage imageNamed:@"boy_shape"]];
    }
    if (_sex == 1) {
        [_sexImg setImage:[UIImage imageNamed:@"girl_shape"]];
    }
    return _sexImg;
}

- (UILabel *)ageLab{
    _ageLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 9)];
    _ageLab.font = [UIFont fontWithName:FontName size:9];
    if(_sex == 0){
        _ageLab.textColor = kRedColor;
    }
    if (_sex == 1) {
        _ageLab.textColor = kGrayColor;
    }
    _ageLab.text = [NSString stringWithFormat:@"%ld", _age];
    return _ageLab;
}

- (void)layoutSubviews{
    
    [self addSubview:self.sexImg];
    [self.sexImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).offset(6);
        make.width.equalTo(self).offset(3);
    }];
    
    [self addSubview:self.ageLab];
    [self.ageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).offset(15);
        make.width.equalTo(self).offset(3);
    }];
}


@end
