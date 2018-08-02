//
//  UIApplication+JFExtension.h
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

@interface UIApplication (JFExtension)

#pragma mark - Top view controller

- (UIWindow *)jf_visibleKeyWindow;

/**
 * Returns the most top view controller excepts `UIAlertController`
 */
- (UIViewController *)jf_mostTopViewController;

#pragma mark - Other

/**
 Aggregates calls to settings `networkActivityIndicatorVisible` to avoid flashing of the indicator in the status bar.
 Simply use `setNetworkActivity:` instead of `setNetworkActivityIndicatorVisible:`.

 Specify `YES` if the application should show network activity and `NO` if it should not. The default value is `NO`.
 A spinning indicator in the status bar shows network activity. The application may explicitly hide or show this
 indicator.

 @param inProgress A Boolean value that turns an indicator of network activity on or off.
 */
- (void)jf_setNetworkActivity:(BOOL)inProgress;

/** Checks for pirated application indicators.

 This isn't bulletproof, but should catch a lot of cases.

 Thanks Marco Arment: <http://twitter.com/marcoarment/status/27965461020>

 @return `YES` if the application may be pirated. `NO` if it is probably not pirated.
 */
- (BOOL)jf_isPirated;
@end
