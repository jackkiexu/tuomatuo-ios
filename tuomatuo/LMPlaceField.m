//
//  LMPlaceField.m
//  tuomatuo
//
//  Created by xjk on 2/3/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "LMPlaceField.h"

@implementation LMPlaceField

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect rect = [super textRectForBounds:bounds];
    rect.origin.y += 4;
    return rect;
}

@end
