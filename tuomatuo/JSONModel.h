//
//  JSONModel.h
//  mhao
//
//  Created by xjk on 6/7/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import "Jastor.h"

@interface JSONModel : Jastor

#pragma mark - init object
+ (id)objectFromDictionary:(NSDictionary*)dictionary;
- (id)initWithDictionary:(NSDictionary *)dictionary;
- (id)initWithJSONString:(NSString *)jsonString;

#pragma mark - parse object
- (NSMutableDictionary *)toDictionary;
- (NSString *)toJSON;

@end
