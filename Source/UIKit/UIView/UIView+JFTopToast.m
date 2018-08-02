//
//  UIView+JFTopToast.m
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

#import "UIView+JFTopToast.h"
#import "UIColor+JFExtension.h"
#import "UIDevice+JFInfo.h"
#import "UIColor+JFExtension.h"
#import "UIApplication+JF.h"
#import <objc/runtime.h>

static CGFloat const kToastHeight =  32.0f;
static NSString *const kBackgroundColorKey = @"MZDTopToast_BackgroundColorKey";
static CGFloat const kAnimationDuration = 0.25f;
static CGFloat const kDismissDelayDuration = 2.0f;

@implementation UIView (JFTopToast)
- (void)jf_toastWithMessage:(NSString *)message {
    UIView *toastView = [self jf_toastViewForMessage:message color:[UIColor jf_colorWithHex:@"ff8d8f"] mustOnTop:NO];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self jf_showToast:toastView mustOnTop:NO];
    });
}

- (void)jf_toastWithMessage:(NSString *)message color:(UIColor *)color {
    UIView *toastView = [self jf_toastViewForMessage:message color:color mustOnTop:NO];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self jf_showToast:toastView mustOnTop:NO];
    });
}

- (void)jf_toastWithMessage:(NSString *)message color:(UIColor *)color onTop:(BOOL)flag {
    UIView *toastView = [self jf_toastViewForMessage:message color:color mustOnTop:flag];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self jf_showToast:toastView mustOnTop:flag];
    });
}

- (void)jf_toastInfoWithMessage:(NSString *)message {
    [self jf_toastWithMessage:message color:[UIColor jf_colorWithHex:@"#70c0f5"]];
}

- (void)jf_toastInfoWithMessage:(NSString *)message onTop:(BOOL)flag {
    [self jf_toastWithMessage:message color:[UIColor jf_colorWithHex:@"#70c0f5"] onTop:flag];
}

- (void)jf_showToast:(UIView *)toast mustOnTop:(BOOL)flag {
    toast.alpha = 1.0;
    UINavigationController *navVc = [[UIApplication sharedApplication] jf_mostTopViewController].navigationController;
    CGFloat topGuideBottom = 0.0;

    void (^onTopBlock)(void) = ^(void){
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:toast];
    };

    if (flag) {
        onTopBlock();
    } else {
        if (navVc.navigationBar && !navVc.isNavigationBarHidden) {
            topGuideBottom = [self __topBarHeight];
            [[[UIApplication sharedApplication] jf_mostTopViewController].view insertSubview:toast belowSubview:navVc.navigationBar];
        } else {
            onTopBlock();
        }
    }

    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:kAnimationDuration delay:0.0 usingSpringWithDamping:0.5f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = toast.frame;
        frame.origin.y = topGuideBottom;
        toast.frame = frame;
    } completion:^(BOOL finished) {
        [weakSelf jf_autoHideToast:toast];
    }];
}

- (void)jf_autoHideToast:(UIView *)toast {
    [self performSelector:@selector(jf_hideToast:) withObject:toast afterDelay:kDismissDelayDuration];
}

- (void)jf_hideToast:(UIView *)toast {
    [UIView animateWithDuration:kAnimationDuration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = toast.frame;
        frame.origin.y = -toast.frame.size.height;
        toast.frame = frame;
    } completion:^(BOOL finished) {
        [toast removeFromSuperview];
    }];
}

- (UIView *)jf_toastViewForMessage:(NSString *)message color:(UIColor *)color mustOnTop:(BOOL)flag {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat height = 0.0;
    BOOL isShowNavBar = NO;
    UINavigationController *navVc = [[UIApplication sharedApplication] jf_mostTopViewController].navigationController;

    BOOL isiPhoneX = [UIDevice jf_isiPhoneX];
    if (flag) {
        height = isiPhoneX ? kToastHeight + 44 : kToastHeight;
    } else {
        if (navVc.navigationBar && !navVc.isNavigationBarHidden) {
            isShowNavBar = YES;
            height = kToastHeight;
        } else {
            isShowNavBar = NO;
            height = isiPhoneX ? kToastHeight + 44 : kToastHeight;
        };
    }

    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, height)];
    background.backgroundColor = color;

    CGRect messageRect = CGRectZero;
    if (isShowNavBar) {
        messageRect = background.bounds;
    } else {
        if (isiPhoneX) {
            messageRect = CGRectMake(0, 34, background.bounds.size.width, kToastHeight);
        } else {
            messageRect = background.bounds;
        }
    }
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:messageRect];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.text = message;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.font = [UIFont systemFontOfSize:15.0];
    [background addSubview:messageLabel];

    return background;
}

- (UIColor *)jf_toastBackgroundColor {
    return objc_getAssociatedObject(self, &kBackgroundColorKey);
}

- (void)jf_setToastBackgroundColor:(UIColor *)color {
    objc_setAssociatedObject(self, &kBackgroundColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
};

- (CGFloat)__topBarHeight {
    UINavigationController *navVc = [[UIApplication sharedApplication] jf_mostTopViewController].navigationController;
    CGFloat height = 0.0;
    if (navVc.navigationBar) {
        CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        height = navVc.navigationBar.frame.size.height + statusBarHeight;
    }
    return height;
}
@end
