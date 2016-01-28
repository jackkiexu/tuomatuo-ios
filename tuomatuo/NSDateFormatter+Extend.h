//
//  NSDateFormatter+Extend.h
//  mmhao
//
//  Created by xjk on 13-12-13.
//  Copyright (c) 2013年 xjk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Extend)

+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSDate *)dateFromString:(NSString *)dateString;
+ (NSString *)messageDateStrFromDate:(NSDate *)date;
+ (NSString *)dateFromMillisecondWithoutSecond:(NSNumber *)number;
+ (NSString *)dateFromNowWithmillisecond:(NSNumber *)number;

+ (NSDate *)dateFromMilliSecond:(NSNumber *)timestamp;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;

@end
