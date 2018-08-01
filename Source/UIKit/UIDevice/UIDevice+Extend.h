//
// Created by sheldon on 10/10/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extend)
+ (BOOL)uponVersion:(CGFloat)version;
+ (BOOL)underVersion:(CGFloat)version;
@end