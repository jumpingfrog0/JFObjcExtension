//
//  UILabel+Extend.h
//  ObjcExtension
//
//  Created by sheldon on 03/12/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extend)

- (void)setTextColor:(UIColor *)color range:(NSRange)range;
- (void)setKeywordColor:(UIColor *)color keywork:(NSString *)keyword;
- (void)setLineSpacing:(CGFloat)space;
- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple;
@end
