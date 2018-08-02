// UIView+JFBlur.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JFBlurEffectStyle) {
    JFBlurEffectStyleExtraLight,
    JFBlurEffectStyleLight,
    JFBlurEffectStyleDark
};

@interface UIView (JFBlur)

/* The UIToolbar/UIVisualEffectView(ios8) that has been put on the current view, use it to do your bidding */
@property(nonatomic, strong, readonly) UIView *jf_blurEffectView;

/* The UIVisualEffectView that should be used for vibrancy element, add subviews to .contentView */
@property(nonatomic, strong, readonly) UIVisualEffectView *jf_vibrancyEffectView;

/* tint color of the blurred view */
@property(nonatomic, strong) UIColor *jf_blurTintColor;

/* intensity of blurTintColor applied on the blur 0.0-1.0, default 0.6f */
@property(nonatomic, assign) CGFloat jf_blurIntensity;

/* Style of Toolbar, remapped to UIViewBlurStyle typedef above */
@property(nonatomic, assign) JFBlurEffectStyle jf_blurStyle;

/* method to enable Blur on current UIView */
- (void)jf_enableBlur:(BOOL)blur;

/* returns if blurring is enabled */
- (BOOL)jf_isBlurred;

@end
