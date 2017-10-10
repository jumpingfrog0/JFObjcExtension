//
// Created by sheldon on 09/10/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import "UIView+Drawing.h"
#import "UIDevice+Extend.h"
#import <objc/runtime.h>

static NSString *const kProgressLayerKey = @"kProgressLayerKey";
static NSString *const kShapeLayerKey    = @"kShapeLayerKey";

static NSString *const kBlurEffectViewKey     = @"kBlurEffectViewKey";
static NSString *const kVibrancyEffectViewKey = @"kVibrancyEffectViewKey";
static NSString *const kBlurTintColorKey      = @"kBlurTintColorKey";
static NSString *const kBlurIntensityKey      = @"kBlurIntensityKey";
static NSString *const kBlurStyleKey          = @"kBlurStyleKey";

@implementation UIView (Drawing)

- (void)setCircleHollowWithMaskColor:(UIColor *)color radius:(CGFloat)radius center:(CGPoint)center {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path appendPath:[UIBezierPath bezierPathWithRect:self.bounds]];
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:center
                                                    radius:radius
                                                startAngle:0
                                                  endAngle:(CGFloat) (2 * M_PI)
                                                 clockwise:NO]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path      = path.CGPath;
    shapeLayer.fillRule  = kCAFillRuleEvenOdd;
    shapeLayer.fillColor = color.CGColor;

    self.backgroundColor = [UIColor clearColor];
    [self.layer addSublayer:shapeLayer];
}

- (void)setCenterCircleHollowWithMaskColor:(UIColor *)color radius:(CGFloat)radius {
    [self setCircleHollowWithMaskColor:color
                                radius:radius
                                center:CGPointMake((CGFloat) (self.bounds.size.width * 0.5), (CGFloat) (self.bounds.size.height * 0.5))];
}

- (void)setHollowWithMaskColor:(UIColor *)color rect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path appendPath:[UIBezierPath bezierPathWithRect:self.bounds]];
    [path appendPath:[UIBezierPath bezierPathWithRect:rect]];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path      = path.CGPath;
    shapeLayer.fillRule  = kCAFillRuleEvenOdd;
    shapeLayer.fillColor = color.CGColor;

    self.backgroundColor = [UIColor clearColor];
    [self.layer addSublayer:shapeLayer];
}

- (void)addCycleProgress:(CGFloat)progress color:(UIColor *)color width:(CGFloat)width {

    if (self.progressLayer != nil) {
        [self.progressLayer removeFromSuperlayer];
    }

    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat radius = 0.0;
    radius = ceilf((self.bounds.size.width - width) * 0.5) + 0.5;
    CGFloat startPoint = -M_PI_2;                       //设置进度条起点位置
    CGFloat endPoint   = -M_PI_2 + M_PI * 2 * progress; //设置进度条终点位置

    //环形路径
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.frame       = self.bounds;
    progressLayer.fillColor   = [[UIColor clearColor] CGColor];            // 填充色为无色
    progressLayer.strokeColor = [color CGColor];                           // 指定path的渲染颜色
    progressLayer.opacity     = 1;                                         //背景颜色的透明度
    progressLayer.lineWidth   = width * [UIScreen mainScreen].scale * 0.5; //线的宽度

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:startPoint
                                                      endAngle:endPoint
                                                     clockwise:YES];
    progressLayer.path = [path CGPath];
    [self.layer addSublayer:progressLayer];

    self.progressLayer = progressLayer;
}

- (void)addCircleLayerWithColor:(UIColor *)color width:(CGFloat)width radius:(CGFloat)radius {
    if (self.shapeLayer != nil) {
        [self.shapeLayer removeFromSuperlayer];
    }

    CGPoint center     = CGPointMake((CGFloat) (self.bounds.size.width * 0.5), (CGFloat) (self.bounds.size.height * 0.5));
    CGFloat startPoint = (CGFloat) -M_PI_2;            //设置进度条起点位置
    CGFloat endPoint   = (CGFloat) (-M_PI_2 + M_PI * 2); //设置进度条终点位置

    //环形路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame       = self.bounds;
    shapeLayer.fillColor   = [[UIColor clearColor] CGColor];            // 填充色为无色
    shapeLayer.strokeColor = [color CGColor];                           // 指定path的渲染颜色
    shapeLayer.opacity     = 1;                                         //背景颜色的透明度
    shapeLayer.lineWidth   = (CGFloat) (width * [UIScreen mainScreen].scale * 0.5); //线的宽度

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:startPoint
                                                      endAngle:endPoint
                                                     clockwise:YES];
    shapeLayer.path = [path CGPath];
    [self.layer addSublayer:shapeLayer];

    self.shapeLayer = shapeLayer;
}

- (void)addRectLayerWithColor:(UIColor *)color width:(CGFloat)width inRect:(CGRect)rect {
    if (self.shapeLayer != nil) {
        [self.shapeLayer removeFromSuperlayer];
    }

    // 路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame       = self.bounds;
    shapeLayer.fillColor   = [[UIColor clearColor] CGColor];            // 填充色为无色
    shapeLayer.strokeColor = [color CGColor];                           // 指定path的渲染颜色
    shapeLayer.opacity     = 1;                                         //背景颜色的透明度
    shapeLayer.lineWidth   = (CGFloat) (width * [UIScreen mainScreen].scale * 0.5); //线的宽度

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    shapeLayer.path = [path CGPath];
    [self.layer addSublayer:shapeLayer];

    self.shapeLayer = shapeLayer;
}

#pragma mark -

- (void)setShapeLayer:(CAShapeLayer *)shapeLayer {
    objc_setAssociatedObject(self, &kShapeLayerKey, shapeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)shapeLayer {
    return (CAShapeLayer *) objc_getAssociatedObject(self, &kShapeLayerKey);
}

- (void)setProgressLayer:(CAShapeLayer *)progressLayer {
    objc_setAssociatedObject(self, &kProgressLayerKey, progressLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)progressLayer {
    return (CAShapeLayer *) objc_getAssociatedObject(self, &kProgressLayerKey);
}

#pragma mark - Blur

- (void)enableBlur:(BOOL)enable {
    if (enable) {
        if ([UIDevice uponVersion:8.0]) {
            if (!self.blurEffectView || !self.vibrancyEffectView) {
                [self renderGaussianBlurEffect];
            }
        } else {
            if (!self.blurEffectView) {
                [self renderCrudeBlurEffect];
            }
        }
    } else {
        [self removeBlurEffect];
    }
}

- (void)removeBlurEffect {
    if (self.blurEffectView) {
        if ([UIDevice uponVersion:8.0]) {
            [self.vibrancyEffectView removeFromSuperview];
            [self.blurEffectView removeFromSuperview];
            objc_setAssociatedObject(self, &kVibrancyEffectViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        } else {
            [self.blurEffectView.layer removeFromSuperlayer];
        }
    }
    objc_setAssociatedObject(self, &kBlurEffectViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)renderGaussianBlurEffect {
    UIBlurEffectStyle style = UIBlurEffectStyleDark;
    if (self.blurStyle == JFBlurEffectStyleExtraLight) {
        style = UIBlurEffectStyleExtraLight;
    } else if (self.blurStyle == JFBlurEffectStyleLight) {
        style = UIBlurEffectStyleLight;
    }

    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *vibrancyView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:blurEffect]];
    vibrancyView.frame = self.bounds;
    NSArray *subviews = self.vibrancyEffectView.contentView.subviews;
    for (UIView *v in subviews) {
        [vibrancyView.contentView addSubview:v];
    }

    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = self.bounds;
    [self addSubview:blurView];
    [blurView.contentView addSubview:vibrancyView];
    blurView.contentView.backgroundColor = [self.blurTintColor colorWithAlphaComponent:self.blurIntensity];

    self.blurEffectView = blurView;
    self.vibrancyEffectView = vibrancyView;
}

- (void)renderCrudeBlurEffect {
    UIToolbar *blurView = (UIToolbar *)self.blurEffectView;
    if (!blurView) {
        blurView = [[UIToolbar alloc] init];
        self.blurEffectView = blurView;
        
        if (self.blurStyle == JFBlurEffectStyleDark) {
            blurView.barStyle = UIBarStyleBlackTranslucent;
        } else {
            blurView.barStyle = UIBarStyleDefault;
        }

        CALayer *colorLayer = [[CALayer alloc] init];
        colorLayer.frame = self.bounds;
        colorLayer.opacity = (float)(self.blurIntensity);
        colorLayer.opaque = NO;
        colorLayer.backgroundColor = self.blurTintColor.CGColor;
        [blurView.layer insertSublayer:colorLayer atIndex:0];
    }
    blurView.frame = self.bounds;
    blurView.clipsToBounds = YES;
    blurView.translucent = YES;

    
    [self.layer insertSublayer:blurView.layer atIndex:0];
}

- (BOOL)isBlurred {
    return self.blurEffectView != nil;
}

- (UIView *)blurEffectView {
    return objc_getAssociatedObject(self, &kBlurEffectViewKey);
}

- (void)setBlurEffectView:(UIView *)blurEffectView {
    return objc_setAssociatedObject(self, &kBlurEffectViewKey, blurEffectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIVisualEffectView *)vibrancyEffectView NS_AVAILABLE_IOS(8_0) {
    return objc_getAssociatedObject(self, &kVibrancyEffectViewKey);
}

- (void)setVibrancyEffectView:(UIVisualEffectView *)effectView {
    objc_setAssociatedObject(self, &kVibrancyEffectViewKey, effectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JFBlurEffectStyle)blurStyle {
    NSNumber *style = objc_getAssociatedObject(self, &kBlurStyleKey);
    if (!style) {
        style = @0;
    }
    return (JFBlurEffectStyle) style.integerValue;
}

- (void)setBlurStyle:(JFBlurEffectStyle)style {
    objc_setAssociatedObject(self, &kBlurStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.blurEffectView) {
        if ([UIDevice uponVersion:8.0]) {
            [self removeBlurEffect];
            [self renderGaussianBlurEffect];
        } else {
            if (style == JFBlurEffectStyleDark) {
                ((UIToolbar *)self.blurEffectView).barStyle = UIBarStyleBlackTranslucent;
            } else {
                ((UIToolbar *)self.blurEffectView).barStyle = UIBarStyleDefault;
            }
        }
    }
}

- (CGFloat)blurIntensity {
    NSNumber *intensity = objc_getAssociatedObject(self, &kBlurIntensityKey);
    if (!intensity) {
        intensity = @0.3;
    }
    return (CGFloat) intensity.doubleValue;
}

- (void)setBlurIntensity:(CGFloat)intensity {
    objc_setAssociatedObject(self, &kBlurIntensityKey, @(intensity), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.blurEffectView) {
        if ([UIDevice uponVersion:8.0]) {
            ((UIVisualEffectView *)self.blurEffectView).contentView.backgroundColor = [self.blurTintColor colorWithAlphaComponent:intensity];
        } else {
            [self removeBlurEffect];
            [self renderCrudeBlurEffect];
        }
    }
}

- (UIColor *)blurTintColor {
    UIColor *color = objc_getAssociatedObject(self, &kBlurTintColorKey);
    if (!color) {
        color = [UIColor clearColor];
        objc_setAssociatedObject(self, &kBlurTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return color;
}

- (void)setBlurTintColor:(UIColor *)color {
    objc_setAssociatedObject(self, &kBlurTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.blurEffectView) {
        if ([UIDevice uponVersion:8.0]) {
            ((UIVisualEffectView *)self.blurEffectView).contentView.backgroundColor = [color colorWithAlphaComponent:self.blurIntensity];
        } else {
            [self removeBlurEffect];
            [self renderCrudeBlurEffect];
        }
    }
}
@end
