//
//  NSDateFormatter+Extend.m
//  mmhao
//
//  Created by xjk on 13-12-13.
//  Copyright (c) 2013年 xjk. All rights reserved.
//

#import "NSDateFormatter+Extend.h"

@implementation NSDateFormatter (Extend)

//  result -> String fromatter -> yyyy-MM-dd HH:mm:ss
+ (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *result = [dateFormatter stringFromDate:date];
    dateFormatter = nil;
    return result;
}

// result -> NSDate formatter -> yyyy-MM-dd HH:mm:ss
+ (NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *result = [dateFormatter dateFromString:dateString];
    dateFormatter = nil;
    return result;
}

//  result -> mm:ss | 昨天 | xx月xx日
+ (NSString *)messageDateStrFromDate:(NSDate *)date{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
   
    NSDate * today = [NSDate date];
    NSDate * yesterday = [NSDate dateWithTimeIntervalSinceNow:-86400];
    NSDate * refDate = date;
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * refDateString = [[refDate description] substringToIndex:10];
    
    if ([refDateString isEqualToString:todayString])
    {
        [dateFormatter setDateFormat:@"HH:mm"];
        return [dateFormatter stringFromDate:date];
    } else if ([refDateString isEqualToString:yesterdayString])
    {
        return @"昨天";
    }
    else
    {
        [dateFormatter setDateFormat:@"MM-dd"];
        return [dateFormatter stringFromDate:date];
    }
}

// 将 毫秒数转化为时间
+ (NSString *)dateStrFromMillisecond:(NSNumber *)number{
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[number doubleValue]/1000];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)dateFromMillisecondWithoutSecond:(NSNumber *)number{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[number doubleValue]/1000];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)dateFromNowWithmillisecond:(NSNumber *)number{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[number doubleValue]/1000];
    return [dateFormatter stringFromDate:date];
}

// 根据 毫秒数得到对应的 日期
+ (NSDate *)dateFromMilliSecond:(NSNumber *)timestamp{
    return [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]/1000];
}

// 将日期转为指定格式的字符串
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSString *result = [dateFormatter stringFromDate:date];
    dateFormatter = nil;
    return result;
}

@end
