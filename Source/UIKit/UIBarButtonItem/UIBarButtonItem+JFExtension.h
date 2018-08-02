//
// UIBarButtonItem+JFExtension.h
// Pods
//
// Created by sheldon on 2018/6/26.
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
