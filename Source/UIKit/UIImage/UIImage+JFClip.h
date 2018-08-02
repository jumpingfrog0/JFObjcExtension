//  UIImage+JFClip.h
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
