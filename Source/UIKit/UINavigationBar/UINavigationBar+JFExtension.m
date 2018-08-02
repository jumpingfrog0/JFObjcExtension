//
// UINavigationBar+JFExtension.m
// Pods
//
// Created by sheldon on 2018/6/26.
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
