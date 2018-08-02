//  UIView+JFBlur.h
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

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JFBlurEffectStyle) {
    JFBlurEffectStyleExtraLight,
    JFBlurEffectStyleLight,
    JFBlurEffectStyleDark
};

@interface UIView (JFBlur)

/* The UIToolbar/UIVisualEffectView(ios8) that has been put on the current view, use it to do your bidding */
@property(nonatomic, strong, readonly) UIView *jf_blurEffectView;

/* The UIVisualEffectView that should be used for vibrancy element, add subviews to .contentView */
@property(nonatomic, strong, readonly) UIVisualEffectView *jf_vibrancyEffectView;

/* tint color of the blurred view */
@property(nonatomic, strong) UIColor *jf_blurTintColor;

/* intensity of blurTintColor applied on the blur 0.0-1.0, default 0.6f */
@property(nonatomic, assign) CGFloat jf_blurIntensity;

/* Style of Toolbar, remapped to UIViewBlurStyle typedef above */
@property(nonatomic, assign) JFBlurEffectStyle jf_blurStyle;

/* method to enable Blur on current UIView */
- (void)jf_enableBlur:(BOOL)blur;

/* returns if blurring is enabled */
- (BOOL)jf_isBlurred;

@end
