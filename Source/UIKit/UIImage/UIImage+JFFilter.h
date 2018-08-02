// UIImage+JFFilter.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIImage (JFFilter)
/**
 *  黑白滤镜
 *
 *  @return 黑白图片
 */
- (UIImage*)jf_grayScaleImage;

/**
 *  混合 maskImage 图层后的图片
 *
 *  @param maskImage 遮罩图层
 *
 *  @return 混合图片
 */
- (UIImage *)jf_imageWithMask:(UIImage *)maskImage;

/**
 *  为图片加入混合色，blendMode 为 kCGBlendModeSourceAtop
 *
 *  @param tintColor 混合的色值
 *
 *  @return 上色后的图片
 */
- (UIImage *)jf_tintedImageWithColor:(UIColor *)tintColor;

/**
 *  将图片上色, 透明部分不处理 blendMode 为 kCGBlendModeDestinationIn
 *
 *  @param color 上色色值
 *
 *  @return color 色的图片
 */
- (UIImage *)jf_hollowOutWithColor:(UIColor *)color;

@end
