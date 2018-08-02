//  UIImage+JFCreate.h
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
