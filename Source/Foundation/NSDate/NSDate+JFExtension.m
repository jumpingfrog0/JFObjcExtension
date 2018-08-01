//
//  NSDate+JFExtension.m
//  ObjcExtension
//
//  Created by sheldon on 25/10/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "NSDate+JFExtension.h"
#import "NSDate+Utilities.h"

@implementation NSDate (JFExtension)
+(NSDate *)dateFromString:(NSString *)str format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:str];
}
@end

