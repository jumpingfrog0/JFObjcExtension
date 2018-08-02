//
// UINavigationBar+JFExtension.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (JFExtension)
- (void)jf_setBackgroundColor:(UIColor *)backgroundColor;
- (void)jf_setCustomBackgroundColor:(UIColor *)backgroundColor;

- (UIView *)jf_overlay;
- (void)setJf_overlay:(UIView *)overlay;
- (void)jf_reset;
@end
