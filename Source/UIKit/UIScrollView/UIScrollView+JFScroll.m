//
// UIScrollView+JFScroll.m
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import "UIScrollView+JFScroll.h"

@implementation UIScrollView (JFScroll)
- (void)jf_scrollToTop
{
    [self jf_scrollToTopAnimated:YES];
}

- (void)jf_scrollToTopAnimated:(BOOL)animated
{
    CGPoint offset = self.contentOffset;
    offset.y = 0 - self.contentInset.top;
    [self setContentOffset:offset animated:animated];
}
@end
