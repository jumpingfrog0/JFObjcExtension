//
//  UIApplication+JFExtension.h
//  FBSnapshotTestCase
//
//  Created by sheldon on 2018/6/25.
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
