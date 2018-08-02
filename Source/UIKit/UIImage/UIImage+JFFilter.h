//  UIImage+JFFilter.h
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
