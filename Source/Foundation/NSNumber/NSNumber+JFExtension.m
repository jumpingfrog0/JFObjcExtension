//
//  NSNumber+JFExtension.m
//  ObjcExtension
//
//  Created by sheldon on 28/11/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "NSNumber+JFExtension.h"

@implementation NSNumber (JFExtension)
- (NSUInteger)length {
    if (self.integerValue == 0) {
        return 1;
    }
    return (int)(log10((double)(self.integerValue))) + 1;
}
@end


