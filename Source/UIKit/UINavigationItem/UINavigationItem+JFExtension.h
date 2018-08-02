//
// UINavigationItem+JFExtension.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (JFExtension)
- (void)jf_setTitleViewWithText:(NSString *)text;
- (void)jf_setLightColorTitleViewWithText:(NSString *)text;
- (void)jf_setTitleViewWithText:(NSString *)text color:(UIColor *)color;

- (void)jf_setTitleViewWithActivityAndText:(NSString *)text;
- (void)jf_setLightColorTitleViewWithActivityAndText:(NSString *)text;

- (void)jf_setupLeftBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)jf_setupRightBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)jf_setupBackBarButtonItem:(UIBarButtonItem *)barButtonItem;

- (void)jf_setupRightBarButtonItems:(NSArray *)items;
- (void)jf_setupLeftBarButtonItems:(NSArray *)items;
@end
