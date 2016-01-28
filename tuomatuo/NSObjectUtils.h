//
//  NSObjectUtils.h
//  mhao
//
//  Created by xjk on 6/5/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"

@interface NSObjectUtils : NSObject

#pragma mark - common method
- (NSMutableArray *)parseClass:(NSString *)className;
- (NSMutableDictionary *)parseObject:(id)object;
- (instancetype)initWithDatabaseResultSet:(FMResultSet *)resultSet withClass:(Class)clas;

#pragma mark - init
+ (NSObjectUtils *)singleton;

@end
