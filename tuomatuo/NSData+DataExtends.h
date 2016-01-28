//
//  NSData+DataExtends.h
//  mhao
//
//  Created by xjk on 5/27/14.
//  Copyright (c) 2014 xjk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TypeSize) {
    SIZE_OF_CHAR = 2,
    SIZE_OF_BYTE = 1,
    SIZE_OF_SHORT = 2,
    SIZE_OF_INT = 4,
    SIZE_OF_LONG = 8,
    SIZE_OF_FLOAT = 4,
    SIZE_OF_DOUBLE = 8,
    SIZE_OF_U_INT_8 = 1,
};


@interface NSData (DataExtends)

+ (NSData *)LongToNSData:(long)data;
+ (uint32_t) NSDataToUint:(NSData *)data;
+ (NSData *)IntToNSData:(int)data;
+ (Byte *)IntToByte:(int)data;
+ (uint32_t)BytesToUint:(Byte *)bytes;

@end
