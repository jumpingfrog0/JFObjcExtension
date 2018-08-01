//
//  NSCalendar+JFExtension.h
//  ObjcExtension
//
//  Created by sheldon on 27/10/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (JFExtension)
+ (NSInteger)numberOfDaysInYear:(NSInteger)year;
+ (NSInteger)numberOfDaysInYear:(NSInteger)year month:(NSInteger)month;
@end;
