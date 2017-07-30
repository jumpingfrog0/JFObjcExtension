//
//  UIView+CKToast.m
//  CommonKit-OC-Demo
//
//  Created by paul on 15-5-24.
//  Copyright (c) 2015年 LiMei. All rights reserved.
//

#import "UIView+CKToast.h"
#import "UIView+Toast.h"

@implementation UIView (CKToast)
- (void)toast:(NSString *)toast
{
    [self makeToast:toast
           duration:1.5
           position:CSToastPositionCenter];
}
@end
