//
//  BaseHelper.h
//  tuomatuo
//
//  Created by xjk on 1/11/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseHelper : NSObject

+ (NSURL *)qiniuImageCenter:(NSString *)link
                  withWidth:(NSString *)width
                 withHeight:(NSString *)height;

+ (NSURL *)qiniuImageCenter:(NSString *)link
                  withWidth:(NSString *)width
                 withHeight:(NSString *)height
                       mode:(NSInteger)model;

@end
