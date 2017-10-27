//
//  ObjcExtensionTests.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 27/07/2017.
//
//
//  Copyright (c) 2017 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <XCTest/XCTest.h>
#import "LogMacros.h"
#import "NSDate+Extend.h"
#import "NSDate+Utilities.h"
#import "NSString+Extend.h"
#import "NSCalendar+Extend.h"

@interface ObjcExtensionTests : XCTestCase

@end

@implementation ObjcExtensionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNSArray {
    NSArray *arr = @[@"小黄人1", @"小黄人2"];
    NSLog(@"%@", arr);
}

- (void)testNSString {
    NSString *str = @"testxxxxxtextxxtest";
    NSArray *targetStrs = [str subStringByRegular:@"te\\St"];
    XCTAssertEqualObjects(targetStrs[0], @"test");
    XCTAssertEqualObjects(targetStrs[1], @"text");
    XCTAssertEqualObjects(targetStrs[2], @"test");
    
    NSString *str2 = @"jumpingfrog0@gamil.com";
    NSString *str3 = @"jumpingfrog0gmail.com";
    XCTAssertTrue([str2 isValidEmail]);
    XCTAssertFalse([str3 isValidEmail]);
    
    NSString *md5Str = [str MD5];
    XCTAssertEqualObjects(md5Str, @"a13f9320bfe0fab240bd587a8d3d5c45");
    
    NSString *sha1Str = [str SHA1];
    XCTAssertEqualObjects(sha1Str, @"82a434c73f0c6ffdb3379301c345d224c76fc4cd");
}

- (void)testNSDate {
    NSString *str = @"2017-10-24";
    NSDate *date1 = [NSDate dateFromString:str format:@"yyyy-MM-dd"];
    NSDate *date2 = [NSDate dateWithYear:2017 month:10 day:24];
    XCTAssertEqualObjects(date1, date2);
}

- (void)testNSCalendar {
    NSInteger numberOfDays = [NSCalendar numberOfDaysInYear:2017 month:10];
    XCTAssertEqual(numberOfDays, 31);

    NSInteger numberOfDays2 =[NSCalendar numberOfDaysInYear:2016];
    XCTAssertEqual(numberOfDays2, 366);
}

@end
