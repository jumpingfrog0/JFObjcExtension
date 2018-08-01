//
//  NSURL+JFExtension.h
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

@interface NSURL (JFExtension)
/**
 *  将 URL 的 query string，按照 key-value 形式返回
 *
 *  @return 返回 query string 中参数的字典，忽略不以 key=value 存在的参数
 */
- (NSDictionary *)jf_parameters;

/**
 *  在当前 URL 后添加 URL query string，如果当前字符串本身没有 query string，则补上 ‘？’ 连接符，如果当前已经有 query string 则后补上 ‘&’ 连接符
 *
 *  @param queryString url query string，key=value&key2=value2
 *
 *  @return 拼接后的 NSURL 对象，如果拼接后的字符串不符合 URL 格式，则返回 nil
 */
- (NSURL *)jf_URLByAppendingQueryString:(NSString *)queryString;

- (NSURL *)jf_URLByAddQueriesFromDictionary:(NSDictionary *)dictionary;
@end
