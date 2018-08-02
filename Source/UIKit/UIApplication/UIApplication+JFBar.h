//
// UIApplication+JFBar.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIApplication (JFBar)
- (CGFloat)jf_topBarHeight;
- (CGFloat)jf_topBarHeightForStickyStatusBar;

+ (CGFloat)jf_topBarHeight;
+ (CGFloat)jf_topBarHeightForStickyStatusBar;

- (BOOL)jf_usesViewControllerBasedStatusBarAppearance;
- (void)jf_updateStatusBarAppearanceHidden:(BOOL)hidden animation:(UIStatusBarAnimation)animation fromViewController:(UIViewController *)sender;
@end
