//
//  UILabel+Extend.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2018/08/02.
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

#import "UILabel+JFExtension.h"
#import "NSMutableAttributedString+JF.h"

@implementation UILabel (JFExtension)
- (void)jf_setTextColor:(UIColor *)color range:(NSRange)range {
    if (!self.text) {
        return;
    }
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedText addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attributedText;
}
    
- (void)jf_setKeywordColor:(UIColor *)color keywork:(NSString *)keyword {
    if (!keyword) {
        return;
    }
    
    NSRange range = [self.text rangeOfString:keyword];
    [self jf_setTextColor:color range:range];
}
    
- (void)jf_setLineSpacing:(CGFloat)space {
    if (!self.text) {
        return;
    }
    NSTextAlignment alignment = self.textAlignment;
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
    self.attributedText = attributedText;
    self.textAlignment = alignment;
}
    
- (void)jf_setLineHeightMultiple:(CGFloat)lineHeightMultiple {
    NSTextAlignment alignment = self.textAlignment;
    NSMutableAttributedString *attributedString = [self.attributedText mutableCopy];
    NSMutableParagraphStyle *paragrahStyle = [NSMutableParagraphStyle new];
    paragrahStyle.lineHeightMultiple = lineHeightMultiple;
    paragrahStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragrahStyle
                             range:NSMakeRange(0, attributedString.length)];
    
    [self setAttributedText:attributedString];
    self.textAlignment = alignment;
}

- (void)jf_strikethrough {
    self.attributedText = [NSMutableAttributedString jf_strikethroughWithText:self.text];
}
@end
