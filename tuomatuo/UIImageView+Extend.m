//
//  UIImageView+Extend.m
//  mhao
//
//  Created by 常凯龙 on 15/7/13.
//  Copyright © 2015年 ailami. All rights reserved.
//

#import "UIImageView+Extend.h"

@implementation UIImageView (Extend)

- (void)addLMCircleBorder
{
    UIImageView *aImgView = [UIImageView new];
    aImgView.image = [UIImage imageNamed:@"A11-btn"];
    [self addSubview:aImgView];
    [aImgView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
