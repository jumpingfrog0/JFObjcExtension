//
//  UIViewController+JFNavigation.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2017/07/27.
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

#import "UIViewController+JFNavigation.h"

@implementation UIViewController (JFNavigation)
#pragma mark - storyboard

+ (instancetype)jf_instantiateFromMainStoryboard {

    return [self jf_instantiateFromStoryboardWithName:@"Main" bundle:nil indentifier:NSStringFromClass([self class])];
}

+ (instancetype)jf_instantiateFromStoryboardWithName:(NSString *)name {

    return  [self jf_instantiateFromStoryboardWithName:name bundle:nil indentifier:NSStringFromClass([self class])];
}

+ (instancetype)jf_instantiateFromStoryboardWithName:(NSString *)name bundle:(NSBundle *)bundle indentifier:(NSString *)indentifier {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:bundle];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:indentifier];
    return controller;
}

#pragma mark - push

+ (void)jf_pushInNavigationController:(UINavigationController *)navVc fromStoryboard:(NSString *)storyboardName {
    UIViewController *controller = [self jf_instantiateFromStoryboardWithName:storyboardName];
    [navVc pushViewController:controller animated:YES];
}

+ (void)jf_pushInNavigationController:(UINavigationController *)navVc {
    UIViewController *controller = [[self alloc] init];
    [navVc pushViewController:controller animated:YES];
}

+ (void)jf_pushInNavigationController:(UINavigationController *)navVc animated:(BOOL)animated {
    UIViewController *controller = [[self alloc] init];
    [navVc pushViewController:controller animated:animated];
}

#pragma mark - present

- (void)jf_present:(__kindof UIViewController *)viewControllerToPresent fromStoryboard:(NSString *)storyboardName inNavigationController:(__kindof UINavigationController *)navigationController {
    UIViewController *vc = [viewControllerToPresent jf_instantiateFromStoryboardWithName:storyboardName];
    UINavigationController *navigation = [navigationController initWithRootViewController:vc];
    [self presentViewController:navigation animated:YES completion:nil];
}

- (void)jf_present:(__kindof UIViewController *)viewControllerToPresent inNavigationController:(__kindof UINavigationController *)navigationController {
    UIViewController *vc = [[viewControllerToPresent alloc] init];
    UINavigationController *navigation = [navigationController initWithRootViewController:vc];
    [self presentViewController:navigation animated:YES completion:nil];
}

#pragma mark - navigatoin

- (void)jf_pushViewController:(UIViewController *)vc backToNode:(NSArray *)nodeClasses
{
    [self jf_pushViewController:vc backToNode:nodeClasses options:NSEnumerationConcurrent];
}

- (void)jf_pushViewController:(UIViewController *)vc backToNode:(NSArray *)nodeClasses options:(NSEnumerationOptions)options
{
    NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
    NSInteger index = [viewControllers indexOfObjectWithOptions:options passingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {

        for (Class class in nodeClasses) {
            if ([obj isKindOfClass:class]) {
                *stop = YES;
                break;
            }
        }

        return *stop;
    }];

    if (index != NSNotFound && index < viewControllers.count - 1) {
        [viewControllers removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index + 1, viewControllers.count - index - 1)]];
    }
    [viewControllers addObject:vc];
    [self.navigationController setViewControllers:viewControllers animated:YES];
}

- (void)jf_popToNode:(NSArray *)nodeClasses
{
    [self jf_popToNode:nodeClasses options:NSEnumerationConcurrent];
}

- (void)jf_popToNode:(NSArray *)nodeClasses options:(NSEnumerationOptions)options
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    NSUInteger index = [viewControllers indexOfObjectWithOptions:options passingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {

        for (Class class in nodeClasses) {
            if ([obj isKindOfClass:class]) {
                *stop = YES;
                break;
            }
        }

        return *stop;
    }];

    if (index != NSNotFound && index < viewControllers.count - 1) {
        UIViewController *vc = viewControllers[index];
        [self.navigationController popToViewController:vc animated:YES];
    }
}

- (void)jf_popAndPushViewController:(UIViewController *)vc {
    [self jf_popAndPushViewController:vc animated:YES];
}

- (void)jf_popAndPushViewController:(UIViewController *)vc animated:(BOOL)animated {
    // 将当前 ViewController 弹出，并 push vc
    NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
    [viewControllers removeObject:self];
    [viewControllers addObject:vc];
    [self.navigationController setViewControllers:viewControllers animated:animated];
}


- (UIViewController *)jf_rePushPreviousNodeIfExist:(Class)vcNode
{
    NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
    NSInteger index = [viewControllers indexOfObjectWithOptions:NSEnumerationReverse passingTest:^BOOL(UIViewController *obj, NSUInteger idx, BOOL *stop) {
        if (idx == viewControllers.count - 2 && [obj isKindOfClass:vcNode]) {
            *stop = YES;
            return YES;
        }

        if (idx < viewControllers.count - 2) {
            *stop = YES;
        }
        return NO;
    }];

    if (index != NSNotFound && index < viewControllers.count - 1) {
        [viewControllers removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index + 1, viewControllers.count - index - 1)]];
        [self.navigationController setViewControllers:viewControllers animated:YES];
        return viewControllers.lastObject;
    }

    return nil;
}
@end
