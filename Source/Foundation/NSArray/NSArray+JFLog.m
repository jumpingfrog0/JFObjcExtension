//
//  NSArray+JFLog.m
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
//

#import "NSArray+JFLog.h"

@implementation NSArray (JFLog)

/**
 * NSLog格式化打印支持UTF8编码
 * 参考：http://www.jianshu.com/p/4ce287f0c2c3
 */
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *strM = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [strM appendString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *lastSymbol = (self.count == idx + 1) ? @"":@",";
        if ([obj respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [strM appendFormat:@"\t%@%@%@\n",tab, [obj descriptionWithLocale:locale indent:level + 1], lastSymbol];
        } else {
            [strM appendFormat:@"\t%@%@%@\n",tab, obj, lastSymbol];
        }
    }];
    [strM appendFormat:@"%@)",tab];
    return strM;
}
@end
