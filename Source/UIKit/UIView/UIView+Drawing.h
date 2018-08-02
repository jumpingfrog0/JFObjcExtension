//
// Created by sheldon on 09/10/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Drawing)

+ (UIView *)jf_topLine;
+ (UIView *)jf_bottomLineWithOffsetX:(CGFloat)offsetX containerHeight:(CGFloat)height;

/**
 * 设置圆形镂空效果
 * @param color 不透明区域的颜色
 * @param radius 圆形半径
 * @param center 圆心
 */
- (void)jf_setCircleHollowWithMaskColor:(UIColor *)color radius:(CGFloat)radius center:(CGPoint)center;

/**
 * 设置居中的圆形镂空效果
 * @param color 不透明区域的颜色
 * @param radius 圆形半径
 */
- (void)jf_setCenterCircleHollowWithMaskColor:(UIColor *)color radius:(CGFloat)radius;

/**
 * 设置矩形镂空效果
 * @param color 不透明区域的颜色
 * @param rect 矩形区域
 */
- (void)jf_setHollowWithMaskColor:(UIColor *)color rect:(CGRect)rect;

/**
 * 设置环形进度条
 * @param progress 当前进度
 * @param color 进度条颜色
 * @param width 进度条宽度
 */
- (void)jf_addCycleProgress:(CGFloat)progress color:(UIColor *)color width:(CGFloat)width;

/**
 * 添加一个圆形图层
 * @param color 图层颜色
 * @param width 图层宽度
 * @param radius 圆形半径
 */
- (void)jf_addCircleLayerWithColor:(UIColor *)color width:(CGFloat)width radius:(CGFloat)radius;

/**
 * 添加一个矩形图层
 * @param color 图层颜色
 * @param width 图层宽度
 * @param rect 矩形区域
 */
- (void)jf_addRectLayerWithColor:(UIColor *)color width:(CGFloat)width inRect:(CGRect)rect;
@end

@interface UIView (JFDrawRectBlock)
typedef void(^JFDrawRectBlock)(CGRect rect);

// Creates and return a UIView (of frame CGRectZero) with a block that gets called on drawRect.
+ (UIView *)jf_viewWithDrawRectBlock:(JFDrawRectBlock)block;

// Creates and return a UIView with a block that gets called on drawRect.
+ (UIView *)jf_viewWithFrame:(CGRect)frame drawRectBlock:(JFDrawRectBlock)block;
@end