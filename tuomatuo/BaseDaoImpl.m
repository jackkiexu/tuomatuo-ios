//
//  BaseDaoImpl.m
//  mhao
//
//  Created by xjk on 6/4/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import "BaseDaoImpl.h"
#import "Sql.h"
#import <objc/runtime.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "NSObjectUtils.h"

#define kDbVersion 3

static BaseDaoImpl *instance = nil;
@interface BaseDaoImpl(){
    FMDatabase *_db;
}

@end

@implementation BaseDaoImpl

#pragma mark - crud
- (NSInteger)delWithID:(NSInteger)ID withClass:(Class)clas{
    if (!ID || !clas) return 0;
    NSString *className = [clas description];
    NSMutableString *sql = [NSMutableString stringWithString:@"delete from "];
    [sql appendString:className];
    [sql appendString:@" where "];
    [sql appendString:@"id"];// 默认主键 id /ID
    [sql appendString:@"=?"];
    NSMutableArray *params = [NSMutableArray array];
    [params addObject:[NSString stringWithFormat:@"%li",(long)ID]];
    return [self executeSQL:sql withArgumentsInArray:params];
}

- (NSInteger)delObject:(NSObject *)object withClass:(Class)clas{
    if (!object || !clas) return 0;
    NSString *className = [clas description];
    NSMutableString *sql = [NSMutableString stringWithString:@"delete from "];
    NSString *sqlR = nil;
    NSMutableArray *params = [NSMutableArray array];
    [sql appendString:className];
    NSDictionary *dic = [[NSObjectUtils singleton] parseObject:object];
    NSArray *keys = [dic allKeys];
    if ([keys count]) {
        [sql appendString:@" where "];
        for (NSString *key in keys) {
            [sql appendString:key];
            [sql appendString:@"=? and "];
            [params addObject:[dic objectForKey:key]];
        }
        sqlR = [sql substringToIndex:[sql length]-4];
    }else{
        sqlR = sql;
    }
    return [self executeSQL:sqlR withArgumentsInArray:params];
}

- (NSInteger)executeSQL:(NSString *)sql withArgumentsInArray:(NSArray *)params{
    BOOL isOk = NO;
    @try {
        [_db open];
        isOk = [_db executeUpdate:sql withArgumentsInArray:params];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.description);
    }
    @finally {
        [_db close];
    }
    return isOk?1:0;
}

- (NSInteger)getCountWithClass:(Class)clas{
    if (!clas) return 0;
    NSUInteger count = 0;
    NSMutableString *sql = [NSMutableString stringWithString:@"select count(*) from "];
    NSString *className = [clas description];
    [sql appendString:className];
    @try {
        [_db open];
        count = [_db intForQuery:sql];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.description);
    }
    @finally {
        [_db close];
    }
    return count;
}

- (NSObject *)getWithID:(NSInteger)ID withClass:(Class)clas{
    if (!clas) return nil;
    NSObject *result = nil;
    NSMutableString *sql = [NSMutableString stringWithString:@"select * from "];
    NSString *className = [clas description];
    [sql appendString:className];
    [sql appendFormat:@" where id = %li", ID];
    @try {
        [_db open];
        FMResultSet *rs = [_db executeQuery:sql];
        while ([rs next]) {
            result = [[NSObjectUtils singleton] initWithDatabaseResultSet:rs withClass:clas];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.description);
    }
    @finally {
        [_db close];
    }
    return result;
}

- (NSMutableArray *)getALLWithClass:(Class)clas{
    if (!clas) return [NSMutableArray array];
    NSMutableArray *array = [NSMutableArray array];
    NSMutableString *sql = [NSMutableString stringWithString:@"select * from "];
    NSString *className = [clas description];
    [sql appendString:className];
    
    @try {
        [_db open];
        FMResultSet *rs = [_db executeQuery:sql];
        while ([rs next]) {
            NSObject *object = [[NSObjectUtils singleton] initWithDatabaseResultSet:rs withClass:clas];
            [array addObject:object];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.description);
    }
    @finally {
        [_db close];
    }
    return array;
}

- (NSInteger)saveObject:(NSObject *)object withClass:(Class)clas{
    if (!object || !clas) return 0;
    NSDictionary *dic = [[NSObjectUtils singleton] parseObject:object];
    return [self saveDictionary:dic withClass:clas];
}

- (NSInteger)saveDictionary:(NSDictionary *)dic withClass:(Class)clas{
    if (dic == nil || ![dic count] || !clas) return 0;
    NSString *className = [clas description];
    NSMutableString *sql = [NSMutableString stringWithString:@"insert into "];
    [sql appendString:className];
    NSMutableString *keysStr = [NSMutableString stringWithString:@" ("];
    NSMutableString *valuesStr = [NSMutableString stringWithString:@" ("];
    NSMutableArray *params = [NSMutableArray array];
    NSArray *keys = [dic allKeys];
    for (NSString *key in keys) {
        id value = [dic valueForKey:key];
        if (!value) continue;
        [keysStr appendFormat:@"%@,", key];
        [valuesStr appendFormat:@"?,"];
        [params addObject:value];
    }
    [keysStr appendString:@")"];
    [valuesStr appendString:@")"];
    [sql appendFormat:@"%@ values %@", [keysStr stringByReplacingOccurrencesOfString:@",)" withString:@")"], [valuesStr stringByReplacingOccurrencesOfString:@",)" withString:@")"]];
    return [self executeSQL:sql withArgumentsInArray:params];
}

- (NSMutableArray *)searchWithDictionary:(NSDictionary *)dic withClass:(Class)clas{
    if (clas == nil || dic == nil) return nil;
    NSString * className = [clas description];
    NSMutableString * sql = [NSMutableString stringWithString:@"select * from "];
    NSString *sqlR = @"";
    NSMutableArray *params = [NSMutableArray array];
    [sql appendString:className];
    if ([dic count]) {
        [sql appendString:@" where "];
        NSArray *array = [dic allKeys];
        for (NSString *key in array) {
            [sql appendString:key];
            [sql appendString:@"=? "];
            [params addObject:[dic valueForKey:key]];
            [sql appendString:@" and "];
        }
        sqlR = [sql substringToIndex:[sql length]-5];
    }else{
        sqlR = sql;
    }
    return [self searchBySQL:sqlR withArgumentsInArray:params withClass:clas];
}

- (NSMutableArray *)searchObject:(NSObject *)object{
    Class clas = [object class];
    NSDictionary *dic = [[NSObjectUtils singleton] parseObject:object];
    return [self searchWithDictionary:dic withClass:clas];
}

- (NSMutableArray *)searchBySQL:(NSString *)sql withArgumentsInArray:(NSArray *)params withClass:(Class)clas{
    NSMutableArray *array = [NSMutableArray array];
    @try {
        [_db open];
        FMResultSet *rs = [_db executeQuery:sql withArgumentsInArray:params];
        while ([rs next]) {
            NSObject *object = [[NSObjectUtils singleton] initWithDatabaseResultSet:rs withClass:clas];
            [array addObject:object];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.description);
    }
    @finally {
        [_db close];
    }
    return array;
}

- (NSInteger)updateByID:(NSInteger)ID withDictionary:(NSDictionary *)dict withClass:(Class)clas{
    if (!ID || !dict) return 0;
    NSString *className = [clas description];
    NSMutableString *sql = [NSMutableString stringWithString:@"update "];
    NSString *sqlR = nil;
    NSMutableArray *params = [NSMutableArray array];
    [sql appendString:className];
    [sql appendString:@" set "];
    NSArray *keys = [dict allKeys];
    for (NSString *key in keys) {
        [sql appendString:key];
        [sql appendString:@"=?, "];
        [params addObject:[dict objectForKey:key]];
    }
    sqlR = [sql substringToIndex:([sql length]-2)];
    sql = [NSMutableString stringWithString:sqlR];
    [sql appendString:@" where "];
    [sql appendString:@" id=? "];
    [params addObject:[NSString stringWithFormat:@"%li", (long)ID]];
    return [self executeSQL:sql withArgumentsInArray:params];
}

- (NSInteger)updateObject:(NSObject *)object withClass:(Class)clas{
    if (!object || !clas) return 0;
    NSMutableDictionary *dic = [[NSObjectUtils singleton] parseObject:object];
    [dic removeObjectForKey:@"id"];
    NSNumber *ID = (NSNumber *)[object valueForKey:@"id"];
    return [self updateByID:[ID longValue] withDictionary:dic withClass:clas];
}

#pragma mark - database method
- (void) create {
    if(![self openDb]){
        return;
    }
    [_db executeUpdate:kTableMsgSummary];
    [_db executeUpdate:kTableMessageBean];
    [_db executeUpdate:kTableMhaoContacts];
    [_db executeUpdate:kTableSecretary];
    [_db executeUpdate:kNumberLocation];
    [_db executeUpdate:kRelationMobile];
    [_db executeUpdate:kCallRecord];
    [_db executeUpdate:kBlackMobile];
    [_db executeUpdate:kTableCloseFriendVmBindBean];
    [_db executeUpdate:KInsideMsg];
    [self closeDb];
}

- (void) upgrade:(int)oldVersion {
    [self create];
}

- (BOOL)openDb {
    NSAssert(_db, @"FMDatabase not initialized.");
    return [_db open];
    
}

- (BOOL)closeDb {
    NSAssert(_db, @"FMDatabase not initialized.");
    return [_db close];
}

- (uint)getUserVersion {
    NSAssert(_db, @"FMDatabase not initialized.");
    @try {
        if ([self openDb]) {
            return [_db intForQuery:@"PRAGMA user_version"];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"exception:%@", exception.description);
    }
    @finally {
        [self closeDb];
    }
    return 0;
}

- (void)setUserVersion:(int)userVersion{
    NSAssert(_db, @"FMDatabase not initialized.");
    @try {
        if ([self openDb]) {
            NSString *sql = [NSString stringWithFormat:@"PRAGMA user_version = %d", userVersion];
            [_db executeUpdate:sql];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"exception:%@", exception.description);
    }
    @finally {
        [self closeDb];
    }
}

#pragma mark - init
- (void) initDb {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _db = [FMDatabase databaseWithPath:kDataBasePath];
    });
    NSLog(@"app path : %@", kDataBasePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:kDataBasePath]){
        uint oldUserVersion = [self getUserVersion];
        if(oldUserVersion != kDbVersion){ //版本号不一致，升级
            [self upgrade:oldUserVersion];
            [self setUserVersion:kDbVersion];
        }
    } else { //数据库未存在，创建数据库
        [self create];
        [self setUserVersion:kDbVersion];
    }
}

- (id)init{
    if (self = [super init]) {
        [self initDb];
    }
    return self;
}

+ (BaseDaoImpl *)singleton{
    if (instance == nil) {
        instance = [[BaseDaoImpl alloc] init];
    }
    return instance;
}

@end
