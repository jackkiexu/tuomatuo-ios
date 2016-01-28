//
//  AvatarImgView.m
//  tuomatuo
//
//  Created by xjk on 1/18/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "AvatarImgView.h"


@implementation AvatarImgView

- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}


// 当外部调用init的方法的时候，其内部也会默默地调用initWithFrame
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, 64, 64)];
    NSLog(@"frame : %@, %@", NSStringFromCGRect(frame), [super class]);
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        if(_sex == 0){
            self.layer.borderColor = kRedColor.CGColor;
        }
        if(_sex == 1){
            self.layer.borderColor = kGrayColor.CGColor;
        }
        self.layer.cornerRadius = self.frame.size.width/2;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 5;
    }
    return self;
}

- (void)setAvatar:(NSString *)url {
    NSURL *URL = [BaseHelper qiniuImageCenter:nil withWidth:@"76" withHeight:@"76"];
    [self sd_setImageWithURL:URL placeholderImage:nil options:SDWebImageRefreshCached];
}

@end
