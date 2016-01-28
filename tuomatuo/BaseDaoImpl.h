//
//  BaseDaoImpl.h
//  mhao
//
//  Created by xjk on 6/4/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDaoImpl : NSObject

#pragma mark - sql method
- (NSInteger)delWithID:(NSInteger)ID withClass:(Class)clas;
- (NSInteger)delObject:(NSObject *)object withClass:(Class)clas;

- (NSInteger)executeSQL:(NSString *)sql withArgumentsInArray:(NSArray *)params;

- (NSInteger)getCountWithClass:(Class)clas;
- (NSObject *)getWithID:(NSInteger)ID withClass:(Class)clas;
- (NSMutableArray *)getALLWithClass:(Class)clas;

- (NSInteger) :(NSObject *)object withClass:(Class)clas;
- (NSInteger)saveDictionary:(NSDictionary *)dic withClass:(Class)clas;
- (NSInteger)saveObject:(NSObject *)object withClass:(Class)clas;
- (NSMutableArray *)searchWithDictionary:(NSDictionary *)dic withClass:(Class)clas;
- (NSMutableArray *)searchObject:(NSObject *)object;
- (NSMutableArray *)searchBySQL:(NSString *)sql withArgumentsInArray:(NSArray *)params withClass:(Class)clas;

- (NSInteger)updateObject:(NSObject *)object withClass:(Class)clas;

#pragma mark - init
- (void) initDb;
+ (BaseDaoImpl *)singleton;

@end
