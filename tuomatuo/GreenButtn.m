//
//  GreenButtn.m
//  tuomatuo
//
//  Created by xjk on 2/3/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "GreenButtn.h"

@implementation GreenButtn

+ (instancetype)buttonWithType:(UIButtonType)buttonType{
    GreenButtn *grBtn = [super buttonWithType:buttonType];
    if (grBtn) {
        grBtn.titleLabel.font = [UIFont fontWithName:FontName size:17];
        [grBtn setBackgroundImage:[UIImage imageWithColor:kBlueColor] forState:UIControlStateNormal];
        [grBtn setBackgroundImage:[UIImage imageWithColor:kBlueColor] forState:UIControlStateHighlighted];
        [grBtn setBackgroundImage:[UIImage imageWithColor:kBlueColor] forState:UIControlStateDisabled];
        [grBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [grBtn setTitleColor:FTColor_Black_3 forState:UIControlStateDisabled];
    }
    return grBtn;
}

@end
