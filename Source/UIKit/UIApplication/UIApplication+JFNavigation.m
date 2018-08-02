//
// UIApplication+JFNavigation.m
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import "UIApplication+JFNavigation.h"
#import <objc/runtime.h>

static NSString const *kPopTargetViewControllerKey = @"kPopTargetViewControllerKey";
static NSString const *kNeedPopToHomeViewControllerKey = @"kNeedPopToHomeViewControllerKey";

@implementation UIApplication (JFNavigation)
- (BOOL)jf_needPopToHomeViewController {
    id object = objc_getAssociatedObject(self, &kNeedPopToHomeViewControllerKey);
    if (object) {
        return [object boolValue];
    } else {
        return NO;
    }
}

- (void)jf_setNeedPopToHomeViewController:(BOOL)isNeed {
    objc_setAssociatedObject(self, &kNeedPopToHomeViewControllerKey, @(isNeed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewController *)jf_popTargetViewController {
    return objc_getAssociatedObject(self, &kPopTargetViewControllerKey);
}

- (void)jf_setPopTargetViewController:(UIViewController *)controller {
    objc_setAssociatedObject(self, &kPopTargetViewControllerKey, controller, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)jf_closeCurrentViewControllerAnimated:(BOOL)animated {
    UIViewController *target = self.jf_popTargetViewController;
    BOOL isNeed = self.jf_needPopToHomeViewController;
    if (isNeed) {
        [target.navigationController popToRootViewControllerAnimated:YES];
        [self jf_setPopTargetViewController:nil];
        [self jf_setNeedPopToHomeViewController:NO];
    } else {
        [target.navigationController popToViewController:target animated:animated];
        [self jf_setPopTargetViewController:nil];
    }
    [target.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
