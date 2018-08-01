//
// Created by sheldon on 10/10/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import "UIDevice+Extend.h"


@implementation UIDevice (Extend)
+ (BOOL)uponVersion:(CGFloat)version
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= version;
}

+ (BOOL)underVersion:(CGFloat)version
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] < version;
}
@end