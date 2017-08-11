//
//  UIViewController+Extend.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 27/07/2017.
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

#import "UIViewController+Extend.h"

@implementation UIViewController (Extend)
+ (instancetype)instantiateFromMainStoryboard {
    
    return [self instantiateFromStoryboardWithName:@"Main" bundle:nil indentifier:NSStringFromClass([self class])];
}

+ (instancetype)instantiateFromStoryboardWithName:(NSString *)name {
    
    return  [self instantiateFromStoryboardWithName:name bundle:nil indentifier:NSStringFromClass([self class])];
}

+ (instancetype)instantiateFromStoryboardWithName:(NSString *)name bundle:(NSBundle *)bundle indentifier:(NSString *)indentifier {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:bundle];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:indentifier];
    return controller;
}

+ (void)pushInNavigationController:(UINavigationController *)navVc fromStoryboard:(NSString *)storyboardName {
    UIViewController *controller = [self instantiateFromStoryboardWithName:storyboardName];
    [navVc pushViewController:controller animated:YES];
}

- (void)present:(__kindof UIViewController *)viewControllerToPresent fromStoryboard:(NSString *)storyboardName inNavigationController:(__kindof UINavigationController *)navigationController {
    UIViewController *vc = [viewControllerToPresent instantiateFromStoryboardWithName:storyboardName];
    UINavigationController *navigation = [navigationController initWithRootViewController:vc];
    [self presentViewController:navigation animated:YES completion:nil];
}

- (void)present:(__kindof UIViewController *)viewControllerToPresent inNavigationController:(__kindof UINavigationController *)navigationController {
    UIViewController *vc = [[viewControllerToPresent alloc] init];
    UINavigationController *navigation = [navigationController initWithRootViewController:vc];
    [self presentViewController:navigation animated:YES completion:nil];
}
@end
