// UIImage+JFCreate.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIImage (JFCreate)
/**
 * 根据颜色生成图片
 * @param color 色值
 * @return image 对象
 */
+ (UIImage *)jf_imageWithColor:(UIColor *)color;

/**
 *  根据颜色和尺寸生成图片
 *
 *  @param color 色值
 *  @param size  尺寸
 *
 *  @return 色值 image 对象
 */
+ (UIImage *)jf_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * 根据颜色、尺寸、圆角生成图片
 *
 * @param size  尺寸
 * @param color 色值
 * @param radius 圆角
 * @return image 对象
 */
+ (UIImage *)jf_imageWithSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)radius;

- (UIImage *)jf_drawImage:(UIImage *)inputImage inRect:(CGRect)frame;
@end
