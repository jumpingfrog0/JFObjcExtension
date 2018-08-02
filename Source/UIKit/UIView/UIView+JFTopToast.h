//
// UIView+JFTopToast.h
// Pods
//
// Created by sheldon on 2018/6/27.
//

#import <UIKit/UIKit.h>

@interface UIView (JFTopToast)
- (void)jf_toastWithMessage:(NSString *)message;
- (void)jf_toastWithMessage:(NSString *)message color:(UIColor *)color;
- (void)jf_toastInfoWithMessage:(NSString *)message onTop:(BOOL)flag;
- (void)jf_toastInfoWithMessage:(NSString *)message;
- (void)jf_hideToast:(UIView *)toast;
@end
