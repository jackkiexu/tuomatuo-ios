//
//  NSDictionary+Extend.h
//  mhao
//
//  Created by xjk on 5/29/14.
//  Copyright (c) 2014 xjk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extend)

+ (NSString*) convertObjectToJson:(NSObject*) object;
+ (NSMutableDictionary *)parseObject:(id)object;
+ (NSMutableDictionary *)parseObjectExceptionid:(id)object;
+ (id)reverseFromJsonToObject:(NSString *)jsonStr toClass:(Class)cla;
+ (id)reverseFromDictionaryToObject:(NSDictionary *)dictionary withClass:(Class)cla;

+ (NSDictionary *)JSONDictionaryFromJSONString:(NSString *)JSONString;

@end
