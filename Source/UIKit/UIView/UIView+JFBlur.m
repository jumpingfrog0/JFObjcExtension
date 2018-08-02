//  UIView+JFBlur.m
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

#import "UIView+JFBlur.h"
#import "UIDevice+JF.h"
#import <objc/runtime.h>

static NSString *const kBlurEffectViewKey     = @"kBlurEffectViewKey";
static NSString *const kVibrancyEffectViewKey = @"kVibrancyEffectViewKey";
static NSString *const kBlurTintColorKey      = @"kBlurTintColorKey";
static NSString *const kBlurIntensityKey      = @"kBlurIntensityKey";
static NSString *const kBlurStyleKey          = @"kBlurStyleKey";

@implementation UIView (JFBlur)

- (void)jf_enableBlur:(BOOL)enable {
    if (enable) {
        if ([UIDevice jf_uponVersion:8.0]) {
            if (!self.jf_blurEffectView || !self.jf_vibrancyEffectView) {
                [self jf_renderGaussianBlurEffect];
            }
        } else {
            if (!self.jf_blurEffectView) {
                [self jf_renderCrudeBlurEffect];
            }
        }
    } else {
        [self jf_removeBlurEffect];
    }
}

- (void)jf_removeBlurEffect {
    if (self.jf_blurEffectView) {
        if ([UIDevice jf_uponVersion:8.0]) {
            [self.jf_vibrancyEffectView removeFromSuperview];
            [self.jf_blurEffectView removeFromSuperview];
            objc_setAssociatedObject(self, &kVibrancyEffectViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        } else {
            [self.jf_blurEffectView.layer removeFromSuperlayer];
        }
    }
    objc_setAssociatedObject(self, &kBlurEffectViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)jf_renderGaussianBlurEffect {
    UIBlurEffectStyle style = UIBlurEffectStyleDark;
    if (self.jf_blurStyle == JFBlurEffectStyleExtraLight) {
        style = UIBlurEffectStyleExtraLight;
    } else if (self.jf_blurStyle == JFBlurEffectStyleLight) {
        style = UIBlurEffectStyleLight;
    }

    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *vibrancyView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:blurEffect]];
    vibrancyView.frame = self.bounds;
    NSArray *subviews = self.jf_vibrancyEffectView.contentView.subviews;
    for (UIView *v in subviews) {
        [vibrancyView.contentView addSubview:v];
    }

    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = self.bounds;
    [self addSubview:blurView];
    [blurView.contentView addSubview:vibrancyView];
    blurView.contentView.backgroundColor = [self.jf_blurTintColor colorWithAlphaComponent:self.jf_blurIntensity];

    self.jf_blurEffectView = blurView;
    self.jf_vibrancyEffectView = vibrancyView;
}

- (void)jf_renderCrudeBlurEffect {
    UIToolbar *blurView = (UIToolbar *)self.jf_blurEffectView;
    if (!blurView) {
        blurView = [[UIToolbar alloc] init];
        self.jf_blurEffectView = blurView;

        if (self.jf_blurStyle == JFBlurEffectStyleDark) {
            blurView.barStyle = UIBarStyleBlackTranslucent;
        } else {
            blurView.barStyle = UIBarStyleDefault;
        }

        CALayer *colorLayer = [[CALayer alloc] init];
        colorLayer.frame = self.bounds;
        colorLayer.opacity = (float)(self.jf_blurIntensity);
        colorLayer.opaque = NO;
        colorLayer.backgroundColor = self.jf_blurTintColor.CGColor;
        [blurView.layer insertSublayer:colorLayer atIndex:0];
    }
    blurView.frame = self.bounds;
    blurView.clipsToBounds = YES;
    blurView.translucent = YES;


    [self.layer insertSublayer:blurView.layer atIndex:0];
}

- (BOOL)jf_isBlurred {
    return self.jf_blurEffectView != nil;
}

- (UIView *)jf_blurEffectView {
    return objc_getAssociatedObject(self, &kBlurEffectViewKey);
}

- (void)setJf_blurEffectView:(UIView *)blurEffectView {
    return objc_setAssociatedObject(self, &kBlurEffectViewKey, blurEffectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIVisualEffectView *)jf_vibrancyEffectView NS_AVAILABLE_IOS(8_0) {
    return objc_getAssociatedObject(self, &kVibrancyEffectViewKey);
}

- (void)setJf_vibrancyEffectView:(UIVisualEffectView *)effectView {
    objc_setAssociatedObject(self, &kVibrancyEffectViewKey, effectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JFBlurEffectStyle)jf_blurStyle {
    NSNumber *style = objc_getAssociatedObject(self, &kBlurStyleKey);
    if (!style) {
        style = @0;
    }
    return (JFBlurEffectStyle) style.integerValue;
}

- (void)setJf_blurStyle:(JFBlurEffectStyle)style {
    objc_setAssociatedObject(self, &kBlurStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jf_blurEffectView) {
        if ([UIDevice jf_uponVersion:8.0]) {
            [self jf_removeBlurEffect];
            [self jf_renderGaussianBlurEffect];
        } else {
            if (style == JFBlurEffectStyleDark) {
                ((UIToolbar *)self.jf_blurEffectView).barStyle = UIBarStyleBlackTranslucent;
            } else {
                ((UIToolbar *)self.jf_blurEffectView).barStyle = UIBarStyleDefault;
            }
        }
    }
}

- (CGFloat)jf_blurIntensity {
    NSNumber *intensity = objc_getAssociatedObject(self, &kBlurIntensityKey);
    if (!intensity) {
        intensity = @0.3;
    }
    return (CGFloat) intensity.doubleValue;
}

- (void)setJf_blurIntensity:(CGFloat)intensity {
    objc_setAssociatedObject(self, &kBlurIntensityKey, @(intensity), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jf_blurEffectView) {
        if ([UIDevice jf_uponVersion:8.0]) {
            ((UIVisualEffectView *)self.jf_blurEffectView).contentView.backgroundColor = [self.jf_blurTintColor colorWithAlphaComponent:intensity];
        } else {
            [self jf_removeBlurEffect];
            [self jf_renderCrudeBlurEffect];
        }
    }
}

- (UIColor *)jf_blurTintColor {
    UIColor *color = objc_getAssociatedObject(self, &kBlurTintColorKey);
    if (!color) {
        color = [UIColor clearColor];
        objc_setAssociatedObject(self, &kBlurTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return color;
}

- (void)setJf_blurTintColor:(UIColor *)color {
    objc_setAssociatedObject(self, &kBlurTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jf_blurEffectView) {
        if ([UIDevice jf_uponVersion:8.0]) {
            ((UIVisualEffectView *)self.jf_blurEffectView).contentView.backgroundColor = [color colorWithAlphaComponent:self.jf_blurIntensity];
        } else {
            [self jf_removeBlurEffect];
            [self jf_renderCrudeBlurEffect];
        }
    }
}
@end

