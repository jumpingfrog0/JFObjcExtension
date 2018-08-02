//
//  UILabel+Extend.h
//  ObjcExtension
//
//  Created by sheldon on 03/12/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JFExtension)

- (void)jf_setTextColor:(UIColor *)color range:(NSRange)range;
- (void)jf_setKeywordColor:(UIColor *)color keywork:(NSString *)keyword;
- (void)jf_setLineSpacing:(CGFloat)space;
- (void)jf_setLineHeightMultiple:(CGFloat)lineHeightMultiple;

- (void)jf_strikethrough;
@end
