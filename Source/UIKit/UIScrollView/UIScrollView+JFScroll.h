//
// UIScrollView+JFScroll.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIScrollView (JFScroll)
- (void)jf_scrollToTop;
- (void)jf_scrollToTopAnimated:(BOOL)animated;
@end
