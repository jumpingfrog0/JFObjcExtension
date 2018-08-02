//
//  UIApplication+JFBar.m
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

#import "UIApplication+JFBar.h"
#import "UIApplication+JFExtension.h"

@implementation UIApplication (JFBar)
- (CGFloat)jf_topBarHeight {
    UINavigationController *navVc = [[UIApplication sharedApplication] jf_mostTopViewController].navigationController;
    CGFloat height = 0.0;
    if (navVc.navigationBar) {
        CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        height = navVc.navigationBar.frame.size.height + statusBarHeight;
    }
    return height;
}

- (CGFloat)jf_topBarHeightForStickyStatusBar {
    UINavigationController *navVc = [[UIApplication sharedApplication] jf_mostTopViewController].navigationController;
    CGFloat height = 0.0;
    if (navVc.navigationBar) {
        CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        if (statusBarHeight == 0.0) {
            statusBarHeight = 20.0;
        }
        height = navVc.navigationBar.frame.size.height + statusBarHeight;
    }
    return height;
}

+ (CGFloat)jf_topBarHeight {
    return [[self sharedApplication] jf_topBarHeight];
}

+ (CGFloat)topBarHeightForStickyStatusBar {
    return [[self sharedApplication] jf_topBarHeightForStickyStatusBar];
}

- (BOOL)jf_usesViewControllerBasedStatusBarAppearance {
    NSString *key = @"UIViewControllerBasedStatusBarAppearance";
    id object = [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
    return (object != nil);
}

- (void)jf_updateStatusBarAppearanceHidden:(BOOL)hidden animation:(UIStatusBarAnimation)animation fromViewController:(UIViewController *)sender {
    if ([self jf_usesViewControllerBasedStatusBarAppearance]) {
        [sender setNeedsStatusBarAppearanceUpdate];
    } else {
        if (@available(iOS 9, *)) {
            NSLog(@"setStatusBarHidden:withAnimation: is deprecated. Please use view-controller-based status bar appearance.");
        } else {
            [[UIApplication sharedApplication] setStatusBarHidden:hidden withAnimation:animation];
        }
        [[UIApplication sharedApplication] setStatusBarHidden:hidden withAnimation:animation];
    }
}
@end
