//
//  NSString+Extend.h
//  mhao
//
//  Created by xjk on 14-1-6.
//  Copyright (c) 2014年 xjk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)

+ (NSString *)convertByteToString:(Byte *)byte;

+ (BOOL) validateMobile:(NSString *)mobile;
+ (BOOL) validateNumber:(NSString *)number;
+ (BOOL) validateEmail:(NSString *)emai;
+ (BOOL) validateQQ:(NSString *)qq;

// 得到 mobile 格式 xxxxxxxxxxx
+ (NSString *)getFormMobileWith:(NSString *)mobile;

// 得到mobile的格式  xxx-xxxx-xxx
+ (NSString *)getMobileFromStr:(NSString *)str;
// 去除符号-
+ (NSString *)getMobileReplaceSymbol:(NSString *)str;
+ (NSString *)stringComponentWithHead:(NSString *)head WithTail:(NSString *)tail;
+ (NSString *)getFormatterTimeWithTime:(NSString *)originTime;// 时间格式->去掉秒
+ (NSString *)encodeURIComponent:(NSString *)string;
+ (NSString *)decodeURIComponent:(NSString *)string;
- (NSString *)displayTime;
+ (NSString *)getProvinceStringWithProvince:(NSString *)province City:(NSString *)city Type:(NSString *)type;
+ (id)parseStringToObject:(NSString *)str WithClass:(Class)clas;
+ (NSString *)valueForParameter:(NSString *)parameterKey WithString:(NSString *)query;
- (BOOL)isEmpty;

//是否存在emoji表情
+ (BOOL)exist_emoji:(NSString *)text;


@end
