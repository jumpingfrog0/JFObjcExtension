//
//  NSString+JFURL.h
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2018/08/01.
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

@interface NSString (JFURL)

/**
 * String by escaping for url argument.
 * @return Encoding url string.
 */
- (NSString *)jf_urlEncode;

/**
 * String by unescaping from url argument.
 * @return Decoding url string.
 */
- (NSString *)jf_urlDecode;

/**
 *  在当前字符串后添加 URL query string，如果当前字符串本身没有 query string，则补上 ‘？’ 连接符，如果当前已经有 query string 则后补上 ‘&’ 连接符
 *
 *  @param queryString url query string，key=value&key2=value2
 *
 *  @return 拼接后的字符串
 */
- (NSString *)jf_URLStringByAppendingQueryString:(NSString *)queryString;

- (NSURL *)jf_URLByAppendingQueryString:(NSString *)queryString;
@end
