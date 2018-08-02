//
//  UILabel+Extend.m
//  ObjcExtension
//
//  Created by sheldon on 03/12/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
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
