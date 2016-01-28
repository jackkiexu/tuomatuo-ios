//
//  BaseEntity.h
//  tuomatuo
//
//  Created by xjk on 1/12/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BaseEntity : MTLModel<MTLJSONSerializing>

#pragma mark - Class Methods to create Entity
+ (NSDateFormatter *)dateFormatter;

+ (id)entityFromDicitionary:(NSDictionary *)data;
+ (NSArray *)arrayOfEntitiesFromArray:(NSArray *)array;

#pragma mark - Instance Method
- (NSDictionary *)transformToDictionary;
+ (NSArray *)transformToArray:(NSArray *)array;

@end
