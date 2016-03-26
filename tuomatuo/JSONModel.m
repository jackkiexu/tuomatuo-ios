//
//  JSONModel.m
//  mhao
//
//  Created by xjk on 6/7/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import "JSONModel.h"

@implementation JSONModel

#pragma mark - init object
+ (id)objectFromDictionary:(NSDictionary*)dictionary{
    return [super objectFromDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary{
    return [super initWithDictionary:dictionary];
}

- (id)initWithJSONString:(NSString *)jsonString{
    NSDictionary *dict = [JSONModel convertJSONToDictionary:jsonString];
    return [self initWithDictionary:dict];
}

#pragma mark - parse object
- (NSMutableDictionary *)toDictionary{
    return [super toDictionary];
}

- (NSString *)toJSON{
    NSMutableDictionary * dict = [self toDictionary];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if (!jsonData) return nil;
    return [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
}


#pragma mark - tools
+ (NSDictionary *)convertJSONToDictionary:(NSString *)jsonString{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(!dict) return nil;
    return dict;
}

@end
