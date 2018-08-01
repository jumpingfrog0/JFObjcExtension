//
//  UILabel+Extend.m
//  ObjcExtension
//
//  Created by sheldon on 03/12/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "UILabel+Extend.h"

@implementation UILabel (Extend)
- (void)setTextColor:(UIColor *)color range:(NSRange)range {
    if (!self.text) {
        return;
    }
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedText addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attributedText;
}
    
- (void)setKeywordColor:(UIColor *)color keywork:(NSString *)keyword {
    if (!keyword) {
        return;
    }
    
    NSRange range = [self.text rangeOfString:keyword];
    [self setTextColor:color range:range];
}
    
- (void)setLineSpacing:(CGFloat)space {
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
    
- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple {
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
@end
