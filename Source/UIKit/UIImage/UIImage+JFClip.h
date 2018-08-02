// UIImage+JFClip.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIImage (JFClip)

- (UIImage *)jf_croppedImage:(CGRect)bounds;

- (UIImage *)jf_clippedImageInRect:(CGRect)rect;

/**
 *  将 rect 范围内的图像处理成圆角半径为 radius 的图片
 *
 *  @param rect   图像范围
 *  @param radius 圆角半径
 *
 *  @return 圆角图片
 */
- (UIImage *)jf_circleImageWithRect:(CGRect)rect radius:(CGFloat)radius;

/**
 *  将 rect 范围内的图像处理成带阴影的圆角半径为 radius 的图片
 *
 *  @param rect   图像范围
 *  @param radius 圆角半径
 *  @param offset 阴影范围
 *  @param blur   阴影模糊度
 *
 *  @return 带阴影的圆角图片
 */
- (UIImage *)jf_shadowCircleImageWithRect:(CGRect)rect radius:(CGFloat)radius offset:(CGSize)offset blur:(CGFloat)blur;

- (UIImage *)jf_centeredCircleImageWithSize:(CGSize)size radius:(CGFloat)radius;

- (UIImage *)jf_centeredCropWithSize:(CGSize)size radius:(CGFloat)radius;

- (UIImage *)jf_circleImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;
@end
