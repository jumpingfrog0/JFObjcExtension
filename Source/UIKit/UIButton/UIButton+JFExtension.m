//
//  UIButton+JFExtension.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 27/07/2017.
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

#import "UIButton+JFExtension.h"

@implementation UIButton (JFExtension)
- (void)jf_alignVerticalWithSpacing:(CGFloat)spacing bottomPadding:(CGFloat)bottomPadding {
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize buttonSize = self.bounds.size;
    
    CGFloat titleBottomOffset = buttonSize.height - titleSize.height - bottomPadding * 2;
    CGFloat imageBottomOffset = buttonSize.height - imageSize.height;
    CGFloat imageTopOffset = (CGFloat) floor((titleSize.height + bottomPadding + spacing) * 2);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -titleBottomOffset, 0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(-imageTopOffset, 0.0, -imageBottomOffset, -titleSize.width);
    
    // increase the content height to avoid clipping
    CGFloat edgeOffset = (CGFloat) (fabs(titleSize.height - imageSize.height) / 2.0);
    self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0.0, edgeOffset, 0.0);
}

- (void)jf_alignVerticalWithSpacing:(CGFloat)spacing {
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);

    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);

    // increase the content height to avoid clipping
    CGFloat edgeOffset = (CGFloat) (fabsf(titleSize.height - imageSize.height) / 2.0);
    self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0.0, edgeOffset, 0.0);
}

- (void)jf_alignHorizontalWithSpacing:(CGFloat)spacing {
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
}

- (void)jf_setTitleColor:(UIColor *)color range:(NSRange)range
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.currentTitle];
    [attrStr setAttributes:@{NSForegroundColorAttributeName: self.currentTitleColor}
                     range:NSMakeRange(0, self.currentTitle.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [self setAttributedTitle:attrStr forState:UIControlStateNormal];
}
@end
