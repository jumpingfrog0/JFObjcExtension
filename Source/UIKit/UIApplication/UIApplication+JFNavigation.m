//
//  UIApplication+JFNavigation.m
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
