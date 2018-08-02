//
// UIApplication+JFNavigation.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIApplication (JFNavigation)
- (BOOL)jf_needPopToHomeViewController;
- (void)jf_setNeedPopToHomeViewController:(BOOL)isNeed;

- (UIViewController *)jf_popTargetViewController;
- (void)jf_setPopTargetViewController:(UIViewController *)controller;

- (void)jf_closeCurrentViewControllerAnimated:(BOOL)animated;
@end
