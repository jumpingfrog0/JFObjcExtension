//  UIView+JFRect.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  提供位置的基本操作, 方便设置
 */
@interface UIView (JFRect)
/**
 *  frame.origin
 */
@property (nonatomic, assign) CGPoint jf_origin;

/**
 *  frame.size
 */
@property (nonatomic, assign) CGSize  jf_size;

/**
 *  frame.origin.y
 */
@property (nonatomic, assign) CGFloat jf_top;

/**
 *  frame.origin.x
 */
@property (nonatomic, assign) CGFloat jf_left;

/**
 *  frame.origin.y + frame.size.height
 */
@property (nonatomic, assign) CGFloat jf_bottom;

/**
 *  frame.origin.x + frame.size.width
 */
@property (nonatomic, assign) CGFloat jf_right;

/**
 *  frame.size.width
 */
@property (nonatomic, assign) CGFloat jf_width;

/**
 *  frame.size.height
 */
@property (nonatomic, assign) CGFloat jf_height;

/**
 *  center.x
 */
@property (nonatomic, assign) CGFloat jf_centerX;

/**
 *  center.y
 */
@property (nonatomic, assign) CGFloat jf_centerY;

/**
 * middle x
 */
@property (nonatomic, assign) CGFloat jf_midX;

/**
 * middle y
 */
@property (nonatomic, assign) CGFloat jf_midY;

- (void)jf_addCenteredSubview:(UIView *)subview;
- (void)jf_moveToCenterOfSuperview;
- (void)jf_centerVerticallyInSuperview;
- (void)jf_centerHorizontallyInSuperview;
@end
