//  UIView+JFRect.m
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

#import "UIView+JFRect.h"

@implementation UIView (JFRect)
- (CGPoint)jf_origin
{
    return self.frame.origin;
}

- (void)setJf_origin:(CGPoint)jf_origin
{
    self.frame = CGRectMake(jf_origin.x, jf_origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)jf_size
{
    return self.frame.size;
}

- (void)setJf_size:(CGSize)jf_size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, jf_size.width, jf_size.height);
}

- (CGFloat)jf_top
{
    return self.frame.origin.y;
}

- (void)setJf_top:(CGFloat)jf_top
{
    self.frame = CGRectMake(self.frame.origin.x, jf_top, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)jf_left
{
    return self.frame.origin.x;
}

- (void)setJf_left:(CGFloat)jf_left
{
    self.frame = CGRectMake(jf_left, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)jf_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setJf_bottom:(CGFloat)jf_bottom
{
    self.frame = CGRectMake(self.frame.origin.x, jf_bottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)jf_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setJf_right:(CGFloat)jf_right
{
    self.frame = CGRectMake(jf_right - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)jf_width
{
    return self.frame.size.width;
}

- (void)setJf_width:(CGFloat)jf_width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, jf_width, self.frame.size.height);
}

- (CGFloat)jf_height
{
    return self.frame.size.height;
}

- (void)setJf_height:(CGFloat)jf_height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, jf_height);
}

- (CGFloat)jf_centerX
{
    return self.center.x;
}

- (void)setJf_centerX:(CGFloat)jf_centerX
{
    self.center = CGPointMake(jf_centerX, self.center.y);
}

- (CGFloat)jf_centerY
{
    return self.center.y;
}

- (void)setJf_centerY:(CGFloat)jf_centerY
{
    self.center = CGPointMake(self.center.x, jf_centerY);
}

- (CGFloat)jf_midX
{
    return (CGFloat) (self.frame.origin.x + floor(self.frame.size.width / 2.0));
}

- (void)setJf_midX:(CGFloat)newX
{
    self.frame = CGRectMake((CGFloat) (newX - floor(self.frame.size.width / 2.0)), self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)jf_midY
{
    return (CGFloat) (self.frame.origin.y + floor(self.frame.size.height / 2.0));
}

- (void)setJf_midY:(CGFloat)newY
{
    self.frame = CGRectMake(self.frame.origin.x, (CGFloat) (newY - floor(self.frame.size.height / 2.0)), self.frame.size.width, self.frame.size.height);
}

- (void)jf_addCenteredSubview:(UIView *)subview
{
    subview.jf_left = (CGFloat) floor(((self.bounds.size.width - subview.jf_width) / 2));
    subview.jf_top = (CGFloat) floor(((self.bounds.size.height - subview.jf_height) / 2));
    [self addSubview:subview];
}

- (void)jf_moveToCenterOfSuperview
{
    self.jf_left = (CGFloat) floor(((self.superview.bounds.size.width - self.jf_width) / 2));
    self.jf_top = (CGFloat) floor(((self.superview.bounds.size.height - self.jf_height) / 2));
}

- (void)jf_centerVerticallyInSuperview
{
    self.jf_top = (CGFloat) floor(((self.superview.bounds.size.height - self.jf_height) / 2));
}

- (void)jf_centerHorizontallyInSuperview
{
    self.jf_left = (CGFloat) floor(((self.superview.bounds.size.width - self.jf_width) / 2));
}
@end
