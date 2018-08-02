// UIView+JFRect.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  提供位置的基本操作, 方便设置
 */
@interface UIView (JFRect)
/**
 *  frame.origin
 */
@property (nonatomic, assign) CGPoint jf_origin;

/**
 *  frame.size
 */
@property (nonatomic, assign) CGSize  jf_size;

/**
 *  frame.origin.y
 */
@property (nonatomic, assign) CGFloat jf_top;

/**
 *  frame.origin.x
 */
@property (nonatomic, assign) CGFloat jf_left;

/**
 *  frame.origin.y + frame.size.height
 */
@property (nonatomic, assign) CGFloat jf_bottom;

/**
 *  frame.origin.x + frame.size.width
 */
@property (nonatomic, assign) CGFloat jf_right;

/**
 *  frame.size.width
 */
@property (nonatomic, assign) CGFloat jf_width;

/**
 *  frame.size.height
 */
@property (nonatomic, assign) CGFloat jf_height;

/**
 *  center.x
 */
@property (nonatomic, assign) CGFloat jf_centerX;

/**
 *  center.y
 */
@property (nonatomic, assign) CGFloat jf_centerY;

/**
 * middle x
 */
@property (nonatomic, assign) CGFloat jf_midX;

/**
 * middle y
 */
@property (nonatomic, assign) CGFloat jf_midY;

- (void)jf_addCenteredSubview:(UIView *)subview;
- (void)jf_moveToCenterOfSuperview;
- (void)jf_centerVerticallyInSuperview;
- (void)jf_centerHorizontallyInSuperview;
@end