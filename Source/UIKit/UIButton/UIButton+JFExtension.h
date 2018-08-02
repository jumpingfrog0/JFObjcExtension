//
//  UIButton+JFExtension.h
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2017/07/27.
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

@interface UIButton (JFExtension)
/**
 * 设置按钮的图片和文字垂直对齐
 * @param spacing 图片与文字的间距
 * @param bottomPadding 文字距离底部的间距
 */
- (void)jf_alignVerticalWithSpacing:(CGFloat)spacing bottomPadding:(CGFloat)bottomPadding;

/**
 * 设置按钮的图片和文字居中垂直对齐
 * @param spacing 图片与文字的间距
 */
- (void)jf_alignVerticalWithSpacing:(CGFloat)spacing;

/**
 * 设置按钮的图片和文字居中水平对齐
 * @param spacing 图片与文字的间距
 */
- (void)jf_alignHorizontalWithSpacing:(CGFloat)spacing;

/**
 * 设置指定范围内的按钮文字颜色
 * @param color 颜色
 * @param range 范围
 */
- (void)jf_setTitleColor:(UIColor *)color range:(NSRange)range;
@end
