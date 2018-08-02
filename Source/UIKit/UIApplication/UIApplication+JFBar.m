//
// UIApplication+JFBar.m
// Pods
//
// Created by sheldon on 2018/6/26.
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
