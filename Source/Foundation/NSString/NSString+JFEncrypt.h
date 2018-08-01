//
//  NSString+JFEncrypt.h
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

@interface NSString (MZDEncrypt)

/**
 *  计算字符串占用字节数
 *
 *  @return 字节数
 */
- (NSInteger)jf_bytes;

/**
 *  将 16 进制字符串转换为 10 进制数
 *
 *  @return 10 进制数
 */
- (NSUInteger)jf_hexValue;

/**
 *  计算所在位置为 filePath 的文件 MD5 值
 */
+ (NSString *)jf_md5OfFile:(NSString *)filePath;


- (NSString *)jf_md5;

//- (NSString *)jf_sha1WithKey:(NSString *)key;

/// 使用SHA1加密字符串
- (NSString *)jf_SHA1;
@end
