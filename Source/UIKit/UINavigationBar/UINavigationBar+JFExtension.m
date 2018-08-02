//
//  UINavigationBar+JFExtension.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2018/08/02.
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

#import "UINavigationBar+JFExtension.h"
#import <objc/runtime.h>
#import "UIImage+JFCreate.h"

static char overlayKey;
static char underlayKey;

@implementation UINavigationBar (JFExtension)
- (UIView *)jf_overlay {
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setJf_overlay:(UIView *)overlay {
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)jf_underlay {
    return objc_getAssociatedObject(self, &underlayKey);
}

- (void)setJf_Underlay:(UIView *)underlay {
    objc_setAssociatedObject(self, &underlayKey, underlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)jf_setBackgroundColor:(UIColor *)backgroundColor {
    if (!self.translucent && self.shadowImage) {
        [self setBackgroundImage:[UIImage jf_imageWithColor:backgroundColor] forBarMetrics:UIBarMetricsDefault];
    } else {
        [self jf_setCustomBackgroundColor:backgroundColor];
    }
}

- (void)jf_setCustomBackgroundColor:(UIColor *)backgroundColor {
    if (!self.jf_overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        self.jf_overlay                        = [[UIView alloc]
                initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.bounds), 64)];
        self.jf_overlay.userInteractionEnabled = NO;
        self.jf_overlay.autoresizingMask       = UIViewAutoresizingFlexibleWidth;

        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView *obj, NSUInteger idx, BOOL *stop) {
            NSRange range = [NSStringFromClass(obj.class) rangeOfString:@"Background"];
            if (range.length > 0) {
                if (obj.frame.origin.y < 0) {
                    CGRect frame = self.jf_overlay.frame;
                    frame.origin.y = 0;
                    self.jf_overlay.frame = frame;
                }
                [obj addSubview:self.jf_overlay];
                *stop = YES;
            }
        }];
    }
    self.jf_overlay.backgroundColor = backgroundColor;
}

- (void)jf_reset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.jf_overlay removeFromSuperview];
    self.jf_overlay = nil;
}
@end
