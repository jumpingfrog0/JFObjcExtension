//
//  NSString+JFValidate.h
//  ObjcExtension
//
//  Created by jumpingfrog0 on 01/08/2018.
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

#import <Foundation/Foundation.h>

@interface NSString (JFValidate)

/**
 *  是否是合法的 email 地址
 *
 *  @return email 地址返回 YES，反之 NO
 */
- (BOOL)jf_isValidEmail;

- (BOOL)jf_isValidPhone;

- (BOOL)jf_isValidIDCard;

/**
 *  当前字符串是否只包含了参数中设置的类型，通过正则表达式匹配, 例如：1a2b3c测试，在三个开关都打开下返回 YES；111 只要 decimal 打开就为 YES； 1a2b，需要 decimal 和 letter 打开
 *
 *  @param decimal 数字 0-9
 *  @param letter  字母 a-z A-Z
 *  @param chinese  中文
 *  @param other   自定义正则
 *
 *  @return 当前字符串若只包含参数指定的项，返回 YES；反之 NO
 */
- (BOOL)jf_isContainDecimal:(BOOL)decimal letter:(BOOL)letter chineseCharacter:(BOOL)chinese other:(NSString *)other;

/**
 * 当前字符串是否全是数字
 * @return 全是数字返回 YES，反之 NO
 */
- (BOOL)jf_isDecimal;

/**
 * 当前字符串是否是整数
 * @return 是整数返回 YES，反之 NO
 */
- (BOOL)jf_isInteger;

/**
 * 当前字符串是否全是中文
 * @return 全是中文返回 YES，反之 NO
 */
- (BOOL)jf_isChineseCharacter;

/**
 * 是否全是空格或换行
 * @return 全是空格或换行返回 YES，反之 NO
 */
- (BOOL)jf_isBlank;
@end
