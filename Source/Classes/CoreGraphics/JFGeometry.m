//
//  JFGeometry.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2019/12/18.
//
//
//  Copyright © 2019 jumpingfrog0. All rights reserved.
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

#import "JFGeometry.h"

#pragma mark - CGRect

CGPoint CGRectMinXMidY(CGRect rect)
{
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
}

CGPoint CGRectMaxXMidY(CGRect rect)
{
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
}

CGPoint CGRedMidXMaxY(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectMidXMinY(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectCenter(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGRect CGRectWithSize(CGSize size)
{
    return CGRectMake(0, 0, size.width, size.height);
}

CGRect CGRectScale(CGRect rect, CGFloat xScale, CGFloat yScale)
{
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width * xScale, rect.size.height * yScale);
}

CGRect CGRectCenterInRect(CGRect rect, CGRect containingRect)
{
    rect.origin.x = CGRectGetMinX(containingRect) + (CGRectGetWidth(containingRect) - CGRectGetWidth(rect)) * 0.5;
    rect.origin.y = CGRectGetMinY(containingRect) + (CGRectGetHeight(containingRect) - CGRectGetHeight(rect)) * 0.5;

    return rect;
}

CGRect CGRectEdgeInset(CGRect rect, CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
{
    return UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(top, left, bottom, right));
}

CGRect CGRectRemainder(CGRect rect, CGFloat amount, CGRectEdge edge)
{
    CGRect slice, remainder;
    CGRectDivide(rect, &slice, &remainder, amount, edge);

    return remainder;
}

CGRect CGRectSlice(CGRect rect, CGFloat amount, CGRectEdge edge)
{
    CGRect slice, remainder;
    CGRectDivide(rect, &slice, &remainder, amount, edge);

    return slice;
}

CGRect CGRectGrow(CGRect rect, CGFloat amount, CGRectEdge edge)
{
    switch (edge) {
        case CGRectMinXEdge:
            return CGRectMake(CGRectGetMinX(rect) - amount,
                              CGRectGetMinY(rect),
                              CGRectGetWidth(rect) + amount,
                              CGRectGetHeight(rect));

        case CGRectMinYEdge:
            return CGRectMake(CGRectGetMinX(rect),
                              CGRectGetMinY(rect) - amount,
                              CGRectGetWidth(rect),
                              CGRectGetHeight(rect) + amount);

        case CGRectMaxXEdge:
            return CGRectMake(
                CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect) + amount, CGRectGetHeight(rect));

        case CGRectMaxYEdge:
            return CGRectMake(
                CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect) + amount);

        default:
            NSCAssert(NO, @"Unrecognized CGRectEdge %li", (long)edge);
            return CGRectNull;
    }
}

void CGRectDivideWithPadding(CGRect rect, CGRect *slicePtr, CGRect *remainderPtr, CGFloat sliceAmount, CGFloat padding,
                             CGRectEdge edge)
{
    CGRect slice;

    // slice
    CGRectDivide(rect, &slice, &rect, sliceAmount, edge);
    if (slicePtr) *slicePtr = slice;

    // padding / remainder
    CGRectDivide(rect, &slice, &rect, padding, edge);
    if (remainderPtr) *remainderPtr = rect;
}

CGRect CGRectFloor(CGRect rect)
{
    return CGRectMake(floor(rect.origin.x), ceil(rect.origin.y), floor(rect.size.width), floor(rect.size.height));
}

CGRect CGRectMakeInverted(CGRect containingRect, CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect = CGRectMake(x, y, width, height);
    return CGRectInvert(containingRect, rect);
}

CGRect CGRectInvert(CGRect containingRect, CGRect rect)
{
    return CGRectMake(CGRectGetMinX(rect),
                      CGRectGetHeight(containingRect) - CGRectGetMaxY(rect),
                      CGRectGetWidth(rect),
                      CGRectGetHeight(rect));
}

BOOL CGRectEqualToRectWithAccuracy(CGRect rect, CGRect rect2, CGFloat epsilon)
{
    return CGPointEqualToPointWithAccuracy(rect.origin, rect2.origin, epsilon) &&
           CGSizeEqualToSizeWithAccuracy(rect.size, rect2.size, epsilon);
}

BOOL CGSizeEqualToSizeWithAccuracy(CGSize size, CGSize size2, CGFloat epsilon)
{
    return (fabs(size.width - size2.width) <= epsilon) && (fabs(size.height - size2.height) <= epsilon);
}

#pragma mark - CGSize

CGSize CGSizeScale(CGSize size, CGFloat scale)
{
    return CGSizeMake(size.width * scale, size.height * scale);
}

#pragma mark - CGPoint

CGPoint CGPointFloor(CGPoint point)
{
    return CGPointMake(floor(point.x), ceil(point.y));
}

BOOL CGPointEqualToPointWithAccuracy(CGPoint p, CGPoint q, CGFloat epsilon)
{
    return (fabs(p.x - q.x) <= epsilon) && (fabs(p.y - q.y) <= epsilon);
}

CGFloat CGPointDotProduct(CGPoint point, CGPoint point2)
{
    return (point.x * point2.x + point.y * point2.y);
}

CGPoint CGPointScale(CGPoint point, CGFloat scale)
{
    return CGPointMake(point.x * scale, point.y * scale);
}

CGFloat CGPointLength(CGPoint point)
{
    return (CGFloat)sqrt(CGPointDotProduct(point, point));
}

CGPoint CGPointMultiply(CGPoint point, CGFloat multiplier)
{
    return CGPointMake(point.x * multiplier, point.y * multiplier);
}

CGPoint CGPointNormalize(CGPoint point)
{
    CGFloat len = CGPointLength(point);
    if (len > 0) return CGPointScale(point, 1 / len);

    return point;
}

CGPoint CGPointProject(CGPoint point, CGPoint direction)
{
    CGPoint normalizedDirection = CGPointNormalize(direction);
    CGFloat distance            = CGPointDotProduct(point, normalizedDirection);

    return CGPointScale(normalizedDirection, distance);
}

CGPoint CGPointProjectAlongAngle(CGPoint point, CGFloat angleInDegrees)
{
    CGFloat angleInRads = (CGFloat)(angleInDegrees * M_PI / 180);
    CGPoint direction   = CGPointMake(cos(angleInRads), sin(angleInRads));
    return CGPointProject(point, direction);
}

CGFloat CGPointAngleInDegrees(CGPoint point)
{
    return (CGFloat)(atan2(point.y, point.x) * 180 / M_PI);
}

CGPoint CGPointAdd(CGPoint p1, CGPoint p2)
{
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

CGPoint CGPointSubtract(CGPoint p1, CGPoint p2)
{
    return CGPointMake(p1.x - p2.x, p1.y - p2.y);
}

CGRect CGRectAlignToRect(CGRect alignee, CGRect aligner, CGRectAlignment alignment)
{
    switch (alignment) {
        case CGRectAlignTop:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * 0.5 - CGRectGetWidth(alignee) * 0.5);
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;

        case CGRectAlignTopLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;

        case CGRectAlignTopRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;

        case CGRectAlignLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * 0.5 - CGRectGetHeight(alignee) * 0.5);
            break;

        case CGRectAlignBottomLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y;
            break;

        case CGRectAlignBottom:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * 0.5 - CGRectGetWidth(alignee) * 0.5);
            alignee.origin.y = aligner.origin.y;
            break;

        case CGRectAlignBottomRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y;
            break;

        case CGRectAlignRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * 0.5 - CGRectGetHeight(alignee) * 0.5);
            break;

        default:
        case CGRectAlignCenter:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * 0.5 - CGRectGetWidth(alignee) * .5);
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * 0.5 - CGRectGetHeight(alignee) * 0.5);
            break;
    }

    return alignee;
}

CGRect CGRectScaleToSize(CGRect scalee, CGSize size, CGRectScaling scaling)
{
    switch (scaling) {
        case CGRectScaleAspectFill:
        case CGRectScaleAspectFit: {
            CGFloat height = CGRectGetHeight(scalee);
            CGFloat width  = CGRectGetWidth(scalee);
            if (isnormal(height) && isnormal(width) && (height > size.height || width > size.width)) {
                CGFloat horiz = size.width / width;
                CGFloat vert  = size.height / height;
                BOOL expand   = (scaling == CGRectScaleAspectFill);
                // We use the smaller scale unless expand is true. In that case, larger.
                CGFloat newScale = ((horiz < vert) ^ expand) ? horiz : vert;
                scalee           = CGRectScale(scalee, newScale, newScale);
            }
            break;
        }
        case CGRectScaleToFill:
            scalee.size = size;
            break;
        case CGRectScaleNone:
        default:
            // Do nothing
            break;
    }

    return scalee;
}
