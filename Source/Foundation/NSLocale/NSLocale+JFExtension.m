// NSLocale+JFExtension.m
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

#import "NSLocale+JFExtension.h"

@implementation NSLocale (JFExtension)
+ (NSLocale *)jf_simplifiedChineseLocale {
    static NSLocale *locale = nil;

    NSString *localeIdentifier = [NSLocale.currentLocale localeIdentifier];
    localeIdentifier = [localeIdentifier stringByReplacingCharactersInRange:NSMakeRange(0, 2) withString:@"zh-Hans"];

    if (!locale || ![localeIdentifier isEqualToString:locale.localeIdentifier]) {
        locale = [[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier];
    }
    return locale;
}
@end