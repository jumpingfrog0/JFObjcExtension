// UIImage+JFBlur.h
// Pods
//
// Created by sheldon on 2018/6/27.
//

#import <UIKit/UIKit.h>

@interface UIImage (JFBlur)

/**
 *  图片高斯模糊效果
 *
 *  @param radius     模糊半径
 *  @param iterations 迭代度
 *  @param tintColor  模糊混合色 blendMode 为 kCGBlendModePlusDarker
 *
 *  @return 高斯模糊图片
 */
- (UIImage *)jf_blurWithRadius:(CGFloat)radius iterations:(NSInteger)iterations tintColor:(UIColor *)tintColor;

+ (UIImage *)jf_boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

- (UIImage *)jf_gaussianBlurWithRadius:(NSInteger)radius;
@end
