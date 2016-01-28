//
//  BaseHelper.m
//  tuomatuo
//
//  Created by xjk on 1/11/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "BaseHelper.h"

@implementation BaseHelper

+ (NSURL *)qiniuImageCenter:(NSString *)link
                  withWidth:(NSString *)width
                 withHeight:(NSString *)height{
    NSString *url = [[NSString alloc] init];
    if ([height isEqualToString:@"0"]) {
        url = [NSString stringWithFormat:@"%@?imageView2/2/w/%@/", link, width];
    } else {
        url = [NSString stringWithFormat:@"%@?imageView/1/w/%@/h/%@", link, width, height];
    }
    return [NSURL URLWithString:url];
}

+ (NSURL *)qiniuImageCenter:(NSString *)link
                  withWidth:(NSString *)width
                 withHeight:(NSString *)height
                       mode:(NSInteger)model{
    NSString *url = [[NSString alloc] init];
    url = [NSString stringWithFormat:@"%@?imageView/%ld/w/%@/h/%@", link, (long)model, width, height];
    return [NSURL URLWithString:url];
}

@end
