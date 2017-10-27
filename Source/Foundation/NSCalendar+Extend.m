//
//  NSCalendar+Extend.m
//  ObjcExtension
//
//  Created by sheldon on 27/10/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "NSCalendar+Extend.h"
#import "NSDate+Utilities.h"

@implementation NSCalendar (Extend)
+ (NSInteger)numberOfDaysInYear:(NSInteger)year {
    NSDate *date = [NSDate dateWithYear:year month:1 day:1];
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:date].length;
}

+ (NSInteger)numberOfDaysInYear:(NSInteger)year month:(NSInteger)month {
    NSDate *date = [NSDate dateWithYear:year month:month day:1];
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}
@end
