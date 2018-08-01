//
//  NSString+JFValidate.m
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

#import "NSString+JFValidate.h"

@implementation NSString (JFValidate)
- (BOOL)jf_isValidEmail {
    NSString *regex   = @"^[A-Z0-9a-z\\._\\%\\+\\-]+@[A-Za-z0-9\\.]+\\.[A-Za-z]{2,4}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

- (BOOL)jf_isValidPhone {
    // 130、131、132、133、134、135、136、137、138、139
    // 145、147
    // 150、151、152、153、155、156、157、158、159
    // 180、181、182、183、184、185、186、187、188、189
    // 173、176、177、178
    NSString *emailRegex   = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[36-8])\\d{8}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)jf_isValidIDCard {
    if (self.length<18) {
        return NO;
    }
    NSMutableArray *IDArray = [NSMutableArray array];
    // 遍历身份证字符串,存入数组中
    for (int i = 0; i < 18; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        [IDArray addObject:subString];
    }
    // 系数数组
    NSArray *coefficientArray = [NSArray arrayWithObjects:@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2", nil];
    // 余数数组
    NSArray *remainderArray = [NSArray arrayWithObjects:@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2", nil];
    // 每一位身份证号码和对应系数相乘之后相加所得的和
    int sum = 0;
    for (int i = 0; i < 17; i++) {
        int coefficient = [coefficientArray[i] intValue];
        int ID = [IDArray[i] intValue];
        sum += coefficient * ID;
    }
    // 这个和除以11的余数对应的数
    NSString *str = remainderArray[(sum % 11)];
    // 身份证号码最后一位
    NSString *string = [self substringFromIndex:17];
    // 如果这个数字和身份证最后一位相同,则符合国家标准,返回YES
    if ([str isEqualToString:string]) {
        NSString *birthdayYer = [self substringWithRange:NSMakeRange(6, 4)];
        NSString *birthdayMan = [self substringWithRange:NSMakeRange(10, 2)];
        NSString *birthdayDay = [self substringWithRange:NSMakeRange(12, 2)];
        if ([birthdayYer intValue]<1900||[birthdayMan intValue]==0||[birthdayMan intValue]>12||[birthdayDay intValue]==1||[birthdayDay intValue]>31) {
            return NO;
        }
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)jf_isAllNumbers {
    NSString *regex        = @"^[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)jf_isContainDecimal:(BOOL)decimal letter:(BOOL)letter chineseCharacter:(BOOL)chinese other:(NSString *)other {
    NSMutableString *regex = [NSMutableString stringWithFormat:@"^["];
    if (letter) {
        [regex appendString:@"a-zA-Z"];
    }
    if (decimal) {
        [regex appendString:@"0-9"];
    }
    [regex appendString:other];
    if (chinese) {
        [regex appendString:@"\u4e00-\u9fa5"];
    }
    [regex appendString:@"]*$"];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)jf_isDecimal {
    return [self jf_isContainDecimal:YES letter:NO chineseCharacter:NO other:nil];
}


- (BOOL)jf_isInteger {
    NSInteger value;
    NSScanner *sc = [NSScanner scannerWithString:self];
    [sc scanInteger:&value];
    return [sc isAtEnd];
}

- (BOOL)jf_isChineseCharacter {
    return [self jf_isContainDecimal:NO letter:NO chineseCharacter:YES other:nil];
}

- (BOOL)jf_isBlank {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:set];
    return trimmedString.length == 0;
}
@end
