//
//  NSNumberExtensionTests.m
//  ObjcExtensionTests
//
//  Created by sheldon on 10/05/2018.
//  Copyright © 2018 jumpingfrog0. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+JFExtension.h"

@interface NSNumberExtensionTests : XCTestCase

@end

@implementation NSNumberExtensionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSNumber *zero = @(0);
    NSNumber *one = @(1);
    NSNumber *ten = @(10);
    NSNumber *number = @(123);
    XCTAssertEqual(zero.length, 1);
    XCTAssertEqual(one.length, 1);
    XCTAssertEqual(ten.length, 2);
    XCTAssertEqual(number.length, 3);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
