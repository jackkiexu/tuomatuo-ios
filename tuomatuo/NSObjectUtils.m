//
//  NSObjectUtils.m
//  mhao
//
//  Created by xjk on 6/5/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import "NSObjectUtils.h"
#import <objc/message.h>
#import "FMResultSet.h"

static NSObjectUtils *instance = nil;
@implementation NSObjectUtils

- (NSMutableArray *)parseClass:(NSString *)className{
    NSMutableArray *array = [NSMutableArray array];
    unsigned int outCount, i;
    id objectClass = objc_getClass([className UTF8String]);
    objc_property_t *properties = class_copyPropertyList(objectClass, &outCount);
    if(properties){
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString *key = [NSString stringWithUTF8String:property_getName(property)];
            [array addObject:key];
        }
        free(properties);
        
    }
    return array;
}

- (NSMutableDictionary *)parseObject:(id)object{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([object class], &propertyCount);
    for (unsigned int i = 0; i < propertyCount; ++i)
    {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id objectValue = [object valueForKey:propertyName];
        if (objectValue != nil && objectValue != [NSNull null]) {
            [dictionary setValue:objectValue forKey:propertyName];
        }
    }
    free(properties);
    return dictionary;
}

- (instancetype)initWithDatabaseResultSet:(FMResultSet *)resultSet withClass:(Class)clas
{
    id resultObject = [[clas alloc] init];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(clas, &propertyCount);
    for (unsigned int i = 0; i < propertyCount; ++i)
    {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        [resultObject setValue:[resultSet objectForColumnName:propertyName] forKey:propertyName];
    }
    free(properties);
    return resultObject;
}

+ (NSObjectUtils *)singleton{
    if (instance == nil) {
        instance = [[NSObjectUtils alloc] init];
    }
    return instance;
}

@end
