//
//  NSString+JFJSON.h
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

@interface NSString (JFJSON)

/**
 *  通过 JSON object 初始化字符串
 *
 *  @param object JSON 对象，NSDictionary 或者 NSArray，子项只支持简单对象
 *
 *  @return 序列化后的 json string，转换失败返回 nil
 */
+ (NSString *)jf_stringWithJSONObject:(id)object;

/**
 *  将当前 字符串转换成 JSON object
 *
 *  @return 如果当前为 json 字符串，则返回序列化后的 json object，否则返回 nil
 */
- (id)jf_JSONObject;

@end
