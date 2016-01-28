//
//  NSData+DataExtends.m
//  mhao
//
//  Created by xjk on 5/27/14.
//  Copyright (c) 2014 xjk. All rights reserved.
//

#import "NSData+DataExtends.h"


@implementation NSData (DataExtends)

+ (Byte *)IntToByte:(int)data{
    Byte *buf = (Byte *)malloc(4);
    for (int i = 3; i>=0; i--) {
        buf[i] = data & 0xff;
        data = data >> 8;
    }
    return buf;
}

+ (NSData *)IntToNSData:(int)data{
    Byte *buf = (Byte *)malloc(4);
    for (int i = 3; i>=0; i--) {
        buf[i] = data & 0xff;
        data = data >> 8;
    }
    return [NSData dataWithBytes:buf length:4];
}

+ (NSData *)LongToNSData:(long)data{
    Byte *buf = (Byte *)malloc(8);
    for(int i = 7; i >= 0; i--){
        buf[i] = data & 0xff;
        data = data >> 8;
    }
    return  [NSData dataWithBytes:buf length:8];
}

// unsigned int == uint32_t
+ (uint32_t) BytesToUint:(Byte *)bytes{
    uint32_t n = (int)bytes[0] << 24;
    n |= (int)bytes[1] << 16;
    n |= (int)bytes[2] << 8;
    n |= (int)bytes[3];
    return n;
}

// unsigned int == uint32_t
+ (uint32_t) NSDataToUint:(NSData *)data{
    unsigned char bytes[4];
    [data getBytes:bytes length:4];
    uint32_t n = (int)bytes[0] << 24;
    n |= (int)bytes[1] << 16;
    n |= (int)bytes[2] << 8;
    n |= (int)bytes[3];
    return n;
}

// 16 进制 位的字符串转 bytes, 可以设定 size, padding 在左边
+ (NSData *)hexStrToData:(NSString *)data withSize:(NSInteger)size{
    long add = size*2 - data.length;
    if (add > 0) {
        NSString *tmp = [[NSString string] stringByPaddingToLength:add withString:@"0" startingAtIndex:0];
        data = [tmp stringByAppendingString:data];
    }
    return [self hexStrToData:data withSize:size];
}

// 16 进制  字符串转 bytes
+ (NSData *)hexStrToNSData:(NSString *)hexStr{
    NSMutableData *data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 < hexStr.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString *ch = [hexStr substringWithRange:range];
        NSScanner *scanner = [NSScanner scannerWithString:ch];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

+ (NSString *)NSDataToHexString:(NSData *)data{
    if (data == nil) {
        return nil;
    }
    NSMutableString *hexString = [NSMutableString string];
    const unsigned char *p = [data bytes];
    for (int i=0; i < [data length]; i++) {
        [hexString appendFormat:@"%02x", *p++];
    }
    return hexString;
}

@end
