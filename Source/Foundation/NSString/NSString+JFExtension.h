//
//  NSString+JFExtension.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JFExtension)

+ (NSString *)jf_parseString:(NSString*)string separatorIndexs:(NSArray *)indexs separator:(NSString *)separator;

- (CGFloat)jf_suitableWidthWithFont:(UIFont *)font height:(CGFloat)height;

- (CGFloat)jf_suitableHeightWithFont:(UIFont *)font width:(CGFloat)width;

- (CGFloat)jf_suitableHeightWithFont:(UIFont *)font size:(CGSize)size;

+ (NSString *)jf_zodiacSignWithMonth:(NSInteger)month day:(NSInteger)day;
+ (NSString *)jf_zodiacSignWithTs:(NSTimeInterval)ts;

/**
 * 根据一个正则表达式在字符串中查找符合条件的子串
 *
 * @param regular 正则表达式
 */
- (NSMutableArray *)jf_subStringByRegular:(NSString *)regular;
@end
