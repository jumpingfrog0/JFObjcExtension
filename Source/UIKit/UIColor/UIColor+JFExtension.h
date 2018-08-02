//
//  UIColor+Extend.h
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

@interface UIColor (JFExtension)
/**
 *  生成一个随机色, 默认不透明
 *
 *  @return 随机色 UIColor 对象
 */
+ (UIColor *)jf_randomColor;

/**
 *  生成一个随机色，可设置颜色的 alpha 值
 *
 *  @param alpha 颜色 alpha 值，范围 0 - 1
 *
 *  @return 随机色 UIColor 对象
 */
+ (UIColor *)jf_randomColor:(CGFloat)alpha;

/**
 *  通过 16 进制色值生成 UIColor 对象, 支持 3，6，8 位，可加 # 或 0x 前缀，如
 *
 *  @param hex 16 进制色值，支持 3，6，8 位，可加 # 或者 0x 前缀，如:
 *             fff ffffff ffffffff
 *             #fff #ffffff #ffffff
 *             0xfff 0xffffff 0xffffffff
 *
 *  @return 16 进制色值对应 UIColor 对象
 */
+ (UIColor *)jf_colorWithHex:(NSString *)hex;

/**
 *  UIColor 对象对应的 16 进制色值, 忽略 alpha 通道
 *
 *  @return 返回 16 进制色值字符串，格式 ffffff
 */
- (NSString *)jf_hexValue;

/**
 *  UIColor 对象对应的 16 进制色值
 *
 *  @param includeAlpha 是否包含 alpha 通道
 *
 *  @return 返回 16 进制色值字符串，包含 alpha 通道格式为 ffffffff， 不包含为 ffffff
 */
- (NSString *)jf_hexValueWithAlpha:(BOOL)includeAlpha;

/**
 *  UIColor 的 Red 色值
 *
 *  @return 范围 0 - 1
 */
- (CGFloat)jf_red;

/**
 *  UIColor 的 Green 色值
 *
 *  @return 范围 0 - 1
 */
- (CGFloat)jf_green;

/**
 *  UIColor 的 Blue 色值
 *
 *  @return 范围 0 - 1
 */
- (CGFloat)jf_blue;

/**
 *  UIColor 的 Alpha 通道值
 *
 *  @return 范围 0 - 1
 */
- (CGFloat)jf_alpha;
@end
