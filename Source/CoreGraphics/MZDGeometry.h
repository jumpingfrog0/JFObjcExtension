//
//  MZDGeometry.h
//  ObjcExtension
//
//  Created by jumpingfrog0 on 12/10/2017.
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

#import "MZDGeometry.h"
#import <UIKit/UIKit.h>
#import <tgmath.h>

typedef NS_ENUM(NSUInteger, CGRectAlignment) {
    CGRectAlignCenter = 0,
    CGRectAlignTop,
    CGRectAlignTopLeft,
    CGRectAlignTopRight,
    CGRectAlignLeft,
    CGRectAlignBottom,
    CGRectAlignBottomLeft,
    CGRectAlignBottomRight,
    CGRectAlignRight
};

typedef NS_ENUM(NSUInteger, CGRectScaling) {
    CGRectScaleAspectFit = 0,
    CGRectScaleToFill,
    CGRectScaleNone,
    CGRectScaleAspectFill = 101
};

#define CGRectClearCoords(_CGRECT) CGRectMake(0, 0, _CGRECT.size.width, _CGRECT.size.height)

// Extends CGRectDivide() to accept the following additional types for the
// `SLICE` and `REMAINDER` arguments:
//
//  - A `CGRect` property
//  - A `CGRect` variable
//  - `NULL`
#define XEARectDivide(RECT, SLICE, REMAINDER, AMOUNT, EDGE) \
	do { \
		CGRect _slice, _remainder; \
		CGRectDivide((RECT), &_slice, &_remainder, (AMOUNT), (EDGE)); \
		\
		_XEAAssignToRectByReference(SLICE, _slice); \
		_XEAAssignToRectByReference(REMAINDER, _remainder); \
	} while (0)

// Returns the exact center point of the given rectangle.
CGPoint CGRectCenter(CGRect rect);

// Return middle of min X side of rectangle
CGPoint CGRectMinXMidY(CGRect rect);

// Return the middle of max X side of rectangle
CGPoint CGRectMaxXMidY(CGRect rect);

/// Return middle of max Y side of rectangle
CGPoint CGRedMidXMaxY(CGRect rect);

/// Return middle of min Y side of rectangle
CGPoint CGRectMidXMinY(CGRect rect);

/// Scales an CGRect
//
// inRect - Rect to scale
// xScale - fraction to scale (1.0 is 100%)
// yScale - fraction to scale (1.0 is 100%)
//
// Returns the converted Rect
CGRect CGRectScale(CGRect rect, CGFloat xScale, CGFloat yScale);

// Returns a rect centered in another rect
CGRect CGRectCenterInRect(CGRect rect, CGRect containingRect);

// Returns a rect with each edge inset by the according amount
CGRect CGRectEdgeInset(CGRect rect, CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);

// Returns a rectangle with an origin of `CGPointZero` and the given size.
CGRect CGRectWithSize(CGSize size);

/// Align rectangles
//
// alignee   - rect to be aligned
// aligner   - rect to be aligned to
// alignment - alignment to be applied to alignee based on aligner
CGRect CGRectAlignToRect(CGRect alignee, CGRect aligner, CGRectAlignment alignment);

// Chops the given amount off of a rectangle's edge.
//
// Returns the remainder of the rectangle, or `CGRectZero` if `amount` is
// greater than or equal to size of the rectangle along the axis being chopped.
CGRect CGRectRemainder(CGRect rect, CGFloat amount, CGRectEdge edge);

// Returns a slice consisting of the given amount starting from a rectangle's
// edge, or the entire rectangle if `amount` is greater than or equal to the
// size of the rectangle along the axis being sliced.
CGRect CGRectSlice(CGRect rect, CGFloat amount, CGRectEdge edge);

// Adds the given amount to a rectangle's edge.
//
// rect   - The rectangle to grow.
// amount - The amount of points to add.
// edge   - The edge from which to grow. Growing is always outward (i.e., using
//          `CGRectMaxXEdge` will increase the width of the rectangle and leave
//          the origin unmodified).
CGRect CGRectGrow(CGRect rect, CGFloat amount, CGRectEdge edge);

// Divides a source rectangle into two component rectangles, skipping the given
// amount of padding in between them.
//
// This functions like CGRectDivide(), but omits the specified amount of padding
// between the two rectangles. This results in a remainder that is `padding`
// points smaller from `edge` than it would be with CGRectDivide().
//
// rect        - The rectangle to divide.
// slice       - Upon return, the portion of `rect` starting from `edge` and
//               continuing for `sliceAmount` points. This argument may be NULL
//               to not return the slice.
// remainder   - Upon return, the portion of `rect` beginning `padding` points
//               after the end of the `slice`. If `rect` is not large enough to
//               leave a remainder, this will be `CGRectZero`. This argument may
//               be NULL to not return the remainder.
// sliceAmount - The number of points to include in `slice`, starting from the
//               given edge.
// padding     - The number of points of padding to omit between `slice` and
//               `remainder`.
// edge        - The edge from which division begins, proceeding toward the
//               opposite edge.
void CGRectDivideWithPadding(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat sliceAmount, CGFloat padding, CGRectEdge edge);

// Extends CGRectDivideWithPadding() to accept the following additional types
// for the `SLICE` and `REMAINDER` arguments:
//
//  - A `CGRect` property
//  - A `CGRect` variable
#define XEARectDivideWithPadding(RECT, SLICE, REMAINDER, AMOUNT, PADDING, EDGE) \
	do { \
		CGRect _slice, _remainder; \
		CGRectDivideWithPadding((RECT), &_slice, &_remainder, (AMOUNT), (PADDING), (EDGE)); \
		\
		_XEAAssignToRectByReference(SLICE, _slice); \
		_XEAAssignToRectByReference(REMAINDER, _remainder); \
	} while (0)

// Round down fractional X origins (moving leftward on screen), round
// up fractional Y origins (moving upward on screen), and round down fractional
// sizes, such that the size of the rectangle will never increase just
// from use of this method.
//
// This function differs from CGRectIntegral() in that the resultant rectangle
// may not completely encompass `rect`. CGRectIntegral() will ensure that its
// resultant rectangle encompasses the original, but may increase the size of
// the result to accomplish this.
CGRect CGRectFloor(CGRect rect);

// Creates a rectangle for a coordinate system originating in the bottom-left.
//
// containingRect - The rectangle that will "contain" the created rectangle,
//                  used as a reference to vertically flip the coordinate system.
// x              - The X origin of the rectangle, starting from the left.
// y              - The Y origin of the rectangle, starting from the top.
// width          - The width of the rectangle.
// height         - The height of the rectangle.
CGRect CGRectMakeInverted(CGRect containingRect, CGFloat x, CGFloat y, CGFloat width, CGFloat height);

// Vertically inverts the coordinates of `rect` within `containingRect`.
//
// This can effectively be used to change the coordinate system of a rectangle.
// For example, if `rect` is defined for a coordinate system starting at the
// top-left, the result will be a rectangle relative to the bottom-left.
//
// containingRect - The rectangle that will "contain" the created rectangle,
//                  used as a reference to vertically flip the coordinate system.
// rect           - The rectangle to vertically flip within `containingRect`.
CGRect CGRectInvert(CGRect containingRect, CGRect rect);

// Returns whether every side of `rect` is within `epsilon` distance of `rect2`.
BOOL CGRectEqualToRectWithAccuracy(CGRect rect, CGRect rect2, CGFloat epsilon);

// Returns whether `size` is within `epsilon` points of `size2`.
BOOL CGSizeEqualToSizeWithAccuracy(CGSize size, CGSize size2, CGFloat epsilon);

// Scales the components of `size` by `scale`.
CGSize CGSizeScale(CGSize size, CGFloat scale);

// Rounds a point to integral numbers. The point will always be moved up and
// left, in view coordinates, so `x` will be rounded down and `y` will be
// rounded up.
CGPoint CGPointFloor(CGPoint point);

// Returns whether `point` is within `epsilon` distance of `point2`.
BOOL CGPointEqualToPointWithAccuracy(CGPoint point, CGPoint point2, CGFloat epsilon);

// Returns the dot product of two points.
CGFloat CGPointDotProduct(CGPoint point, CGPoint point2);

// Returns `point` scaled by `scale`.
CGPoint CGPointScale(CGPoint point, CGFloat scale);

// Returns the length of `point`.
CGFloat CGPointLength(CGPoint point);

// Returns `point` multiple by `multiplier`
CGPoint CGPointMultiply(CGPoint point, CGFloat multiplier);

// Returns the unit vector of `point`.
CGPoint CGPointNormalize(CGPoint point);

// Returns a projected point in the specified direction.
CGPoint CGPointProject(CGPoint point, CGPoint direction);

// Returns the angle of a vector.
CGFloat CGPointAngleInDegrees(CGPoint point);

// Projects a point along a specified angle.
CGPoint CGPointProjectAlongAngle(CGPoint point, CGFloat angleInDegrees);

// Add `p1` and `p2`.
CGPoint CGPointAdd(CGPoint p1, CGPoint p2);

// Subtracts `p2` from `p1`.
CGPoint CGPointSubtract(CGPoint p1, CGPoint p2);


// For internal use only.
//
// Returns a pointer to a new empty rectangle, suitable for storing unused
// values.
#define _XEAEmptyRectPointer \
	(&(CGRect){ .origin = CGPointZero, .size = CGSizeZero })

// For internal use only.
//
// Assigns `RECT` into the first argument, which may be a property, `CGRect`
// variable, or a pointer to a `CGRect`. If the argument is a pointer and is
// `NULL`, nothing happens.
#define _XEAAssignToRectByReference(RECT_OR_PTR, RECT) \
	/* Switches based on the type of the first argument. */ \
	(_Generic((RECT_OR_PTR), \
			CGRect *: *({ \
				/* Copy the argument into a union so this code compiles even
				 * when it's not a pointer. */ \
				union { \
					__typeof__(RECT_OR_PTR) copy; \
					CGRect *ptr; \
				} _u = { .copy = (RECT_OR_PTR) }; \
				\
				/* If the argument is NULL, assign into an empty rect instead. */ \
				_u.ptr ?: _XEAEmptyRectPointer; \
			}), \
			\
			/* void * should only occur for NULL. */ \
			void *: *_XEAEmptyRectPointer, \
			\
			/* For all other cases, assign into the given variable or property
			 * normally. */ \
			default: RECT_OR_PTR \
		) = (RECT))
