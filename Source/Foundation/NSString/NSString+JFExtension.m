//
//  NSString+JFExtension.m
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

#import "NSString+JFExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (JFExtension)

+ (NSString *)jf_parseString:(NSString*)string separatorIndexs:(NSArray *)indexs separator:(NSString *)separator {
    if (!string) return nil;
    NSMutableString *mStr = [NSMutableString stringWithString:[string stringByReplacingOccurrencesOfString:separator withString:@""]];
    [indexs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger index = [obj integerValue];
        if (mStr.length > index) [mStr insertString:separator atIndex:index];
    }];
    return  mStr;
}

- (CGFloat)jf_suitableWidthWithFont:(UIFont *)font height:(CGFloat)height
{
    CGSize constraintSize = CGSizeMake(MAXFLOAT, height);
    CGSize realSize;
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    NSDictionary *attribute = @{NSFontAttributeName: font};
    realSize                = [self boundingRectWithSize:constraintSize
                                                 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              attributes:attribute
                                                 context:nil]
    .size;
    return ceilf(realSize.width);
}

- (CGFloat)jf_suitableHeightWithFont:(UIFont *)font width:(CGFloat)width
{
    CGSize constraintSize = CGSizeMake(width, MAXFLOAT);
    CGSize realSize;
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    NSDictionary *attribute = @{NSFontAttributeName: font};
    realSize                = [self boundingRectWithSize:constraintSize
                                                 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              attributes:attribute
                                                 context:nil]
    .size;
    return ceilf(realSize.height);
}

- (CGFloat)jf_suitableHeightWithFont:(UIFont *)font size:(CGSize)size
{
    CGSize realSize;
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    NSDictionary *attribute = @{NSFontAttributeName: font};
    realSize                = [self boundingRectWithSize:size
                                                 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              attributes:attribute
                                                 context:nil]
    .size;
    return ceilf(realSize.height);
}

#pragma mark - 星座
+ (NSString *)jf_zodiacSignWithMonth:(NSInteger)m day:(NSInteger)d
{
    NSString *zodiacString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *zodiacFormat = @"102123444543";
    
    if (m<1||m>12||d<1||d>31){
        return @"";
    }
    
    if(m==2 && d>29) {
        return @"";
    } else if (m==4 || m==6 || m==9 || m==11) {
        if (d>30) {
            return @"";
        }
    }
    
    NSString *result = [NSString stringWithFormat:@"%@座",[zodiacString substringWithRange:NSMakeRange(m*2-(d < [[zodiacFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
    
    return result;
}

+ (NSString *)jf_zodiacSignWithTs:(NSTimeInterval)ts
{
    NSDate *today = [NSDate dateWithTimeIntervalSince1970:ts];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:today];
    NSInteger month = [weekdayComponents month];
    NSInteger day = [weekdayComponents day];
    return [NSString jf_zodiacSignWithMonth:month day:day];
}

#pragma mark - Regular

- (NSArray *)jf_subStringByRegular:(NSString *)regular
{
    NSRange range = [self rangeOfString:regular options:NSRegularExpressionSearch];
    if (range.length == 0 || range.location == NSNotFound) {
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    while (range.length != 0 && range.location != NSNotFound) {
        NSString *subStr = [self substringWithRange:range];
        [array addObject:subStr];
        
        NSRange subRange = NSMakeRange(range.location + range.length, self.length - range.location - range.length);
        range = [self rangeOfString:regular options:NSRegularExpressionSearch range:subRange];
    }
    return array;
}
@end
