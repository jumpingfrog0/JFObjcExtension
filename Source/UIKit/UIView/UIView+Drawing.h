//
// Created by sheldon on 09/10/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JFBlurEffectStyle) {
    JFBlurEffectStyleExtraLight,
    JFBlurEffectStyleLight,
    JFBlurEffectStyleDark
};

@interface UIView (Drawing)
/**
 * 设置圆形镂空效果
 * @param color 不透明区域的颜色
 * @param radius 圆形半径
 * @param center 圆心
 */
- (void)setCircleHollowWithMaskColor:(UIColor *)color radius:(CGFloat)radius center:(CGPoint)center;

/**
 * 设置居中的圆形镂空效果
 * @param color 不透明区域的颜色
 * @param radius 圆形半径
 */
- (void)setCenterCircleHollowWithMaskColor:(UIColor *)color radius:(CGFloat)radius;

/**
 * 设置矩形镂空效果
 * @param color 不透明区域的颜色
 * @param rect 矩形区域
 */
- (void)setHollowWithMaskColor:(UIColor *)color rect:(CGRect)rect;

/**
 * 设置环形进度条
 * @param progress 当前进度
 * @param color 进度条颜色
 * @param width 进度条宽度
 */
- (void)addCycleProgress:(CGFloat)progress color:(UIColor *)color width:(CGFloat)width;

/**
 * 添加一个圆形图层
 * @param color 图层颜色
 * @param width 图层宽度
 * @param radius 圆形半径
 */
- (void)addCircleLayerWithColor:(UIColor *)color width:(CGFloat)width radius:(CGFloat)radius;

/**
 * 添加一个矩形图层
 * @param color 图层颜色
 * @param width 图层宽度
 * @param rect 矩形区域
 */
- (void)addRectLayerWithColor:(UIColor *)color width:(CGFloat)width inRect:(CGRect)rect;

#pragma mark - Blur

@property(nonatomic, strong, readonly) UIView *blurEffectView;
@property(nonatomic, strong, readonly) UIVisualEffectView *vibrancyEffectView;
@property(nonatomic, strong) UIColor *blurTintColor;
@property(nonatomic, assign) CGFloat blurIntensity;
@property(nonatomic, assign) JFBlurEffectStyle blurStyle;

- (void)enableBlur:(BOOL)blur;
- (BOOL)isBlurred;
@end