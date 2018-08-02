//
//  UIView+JFExtension.h
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

#import <UIKit/UIKit.h>

@interface UIView (JFExtension)

/**
 * 获取当前view对应的控制器
 */
- (UIViewController *)jf_viewController;

- (void)jf_setTopLineWithColor:(UIColor *)color;
- (void)jf_setTopLineWithImageName:(NSString *)imageName;
- (void)jf_setBottomLineWithColor:(UIColor *)color;
- (void)jf_setBottomLineWithImageName:(NSString *)imageName;

/**
 * 移除iOS11下搜索框的动画时，必须在 `viewDidAppear:` 中调用，且必须在调用 `becomeFirstResponder` 方法之后
 */
- (void)jf_removeLayerAnimationsRecursively;

@end
