//
//  tuomatuoTests.m
//  tuomatuoTests
//
//  Created by xjk on 1/10/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <QiniuSDK.h>

@interface tuomatuoTests : XCTestCase

@end

@implementation tuomatuoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"setUp");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"tearDown");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"testExample");
    
    NSString *token = @"QvhmpqbMQGcHewZ8lOQziT91Avt6S2cBfrR7PZzy:uHEiNIdDt5aFVYtf4kLk2PNuIss=:eyJzY29wZSI6InR1b21hdHVvIiwiZGVhZGxpbmUiOjE0NTM5NzQwOTl9";
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    NSData *data = [@"Hello, World!" dataUsingEncoding : NSUTF8StringEncoding];
    [upManager putData:data key:@"hello" token:token
              complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                  NSLog(@"info : %@", info);
                  NSLog(@"resp : %@", resp);
              } option:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSLog(@"testPerformanceExample");
    }];
}

@end
