//
//  UIBarButtonItem+JFExtension.h
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

#import <Foundation/Foundation.h>

@interface UIBarButtonItem (JFExtension)
+ (UIBarButtonItem *)jf_cancelBarButtonItemWithTitle:(NSString *)title handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_backBarButtonItemWithTitle:(NSString *)title
                                        handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_closeBarButtonItemWithHandler:(void (^)(id sender))action;
+ (UIBarButtonItem *)jf_darkCloseBarButtonItemWithHandler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_plainBarButtonItemWithTitle:(NSString *)title
                                         handler:(void (^)(id sender))action;
+ (UIBarButtonItem *)jf_plainBarButtonItemWithTitle:(NSString *)title
                                       tintColor:(UIColor *)tintColor
                                         handler:(void (^)(id sender))action;
+ (UIBarButtonItem *)jf_plainBarButtonItemWithNormalTitle:(NSString *)normalTitle
                                         selectedTitle:(NSString *)selectedTitle
                                               handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_doneBarButtonItemWithTitle:(NSString *)title
                                        handler:(void (^)(id sender))action;

#pragma mark -

+ (UIBarButtonItem *)jf_barButtonItemWithImage:(UIImage *)image
                                    handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_barButtonItemWithImage:(UIImage *)image
                                    padding:(CGFloat)padding
                                    handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                                    handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_barButtonItemWithNormalTitle:(NSString *)normalTitle
                                    selectedTitle:(NSString *)selectedTitle
                                        tintColor:(UIColor *)color
                                            image:(UIImage *)image
                                          handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_barButtonItemWithTitle:(NSString *)title
                                  tintColor:(UIColor *)color
                                      image:(UIImage *)image
                                    handler:(void (^)(id sender))action;

#pragma mark - badge

+ (UIBarButtonItem *)jf_badgeBarButtonItemWithImage:(UIImage *)image
                                         handler:(void (^)(id sender))action;

+ (UIBarButtonItem *)jf_badgeBarButtonItemWithImage:(UIImage *)image
                                         padding:(CGFloat)padding
                                         handler:(void (^)(id sender))action;

- (void)jf_setBadge:(NSInteger)badge;
@end
