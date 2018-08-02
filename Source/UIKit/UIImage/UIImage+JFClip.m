//  UIImage+JFClip.m
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

#import "UIImage+JFClip.h"

@implementation UIImage (JFClip)
// Returns a copy of this image that is cropped to the given bounds.
// The bounds will be adjusted using CGRectIntegral.
// This method ignores the image's imageOrientation setting.
- (UIImage *)jf_croppedImage:(CGRect)bounds {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], bounds);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

- (UIImage *)jf_clippedImageInRect:(CGRect)rect
{
    CGFloat scale = MAX(self.scale, 1.0);
    CGRect scaleRect =
                    CGRectMake(rect.origin.x * scale, rect.origin.y * scale, rect.size.width * scale, rect.size.height * scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, scaleRect);
    return [[UIImage alloc] initWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationUp];
}

- (UIImage *)jf_circleImageWithRect:(CGRect)rect radius:(CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rect.size.width, rect.size.height) cornerRadius:radius];

    CGFloat imageRatio = self.size.width / self.size.height;
    CGSize imageSize = CGSizeMake(rect.size.height * imageRatio, rect.size.height);
    CGRect imageRect = CGRectMake(0, 0, ceilf(imageSize.width), ceilf(imageSize.height));

    [path addClip];
    [self drawInRect:imageRect];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (UIImage *)jf_shadowCircleImageWithRect:(CGRect)rect radius:(CGFloat)radius offset:(CGSize)offset blur:(CGFloat)blur
{
    UIImage *sourceImage = [self jf_circleImageWithRect:rect radius:radius];

    CGFloat targetX;
    CGFloat targetY;
    CGFloat targetWidth;
    CGFloat targetHeight;

    if (offset.width == 0) {
        targetX = blur;
        targetWidth = rect.size.width + 2 * blur;
    }
    else if (offset.width > 0) {
        targetX = 0;
        targetWidth = rect.size.width + blur + offset.width;
    }
    else {
        targetX = blur + offset.width;
        targetWidth = rect.size.width + blur + offset.width;
    }

    if (offset.height == 0) {
        targetY = blur;
        targetHeight = rect.size.height + 2 * blur;
    }
    else if (offset.height > 0) {
        targetY = 0;
        targetHeight = rect.size.height + blur + offset.height;
    }
    else {
        targetY = blur + offset.height;
        targetHeight = rect.size.height + blur + offset.height;
    }

    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth * scale, targetHeight * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(context, 0.0, rect.size.height * scale);
    CGContextScaleCTM(context, 1.0, -1.0);

    CGRect pathRect = CGRectMake(targetX * scale, targetY * scale, rect.size.width * scale, rect.size.height * scale);

    CGColorRef colorRef = CGColorCreateCopy([[UIColor colorWithRed:0 green:0 blue:0 alpha:0.75] CGColor]);
    CGContextSetShadowWithColor(context, CGSizeMake(offset.width * scale, offset.height * scale), blur * scale, colorRef);
    CGColorRelease(colorRef);

    CGContextDrawImage(context, pathRect, sourceImage.CGImage);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (UIImage *)jf_centeredCircleImageWithSize:(CGSize)size radius:(CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath *path =
                         [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
    [path addClip];
    CGFloat ratio;
    if (self.size.width > self.size.height) {
        ratio = self.size.height / size.height;
    } else {
        ratio = self.size.width / size.width;
    }
    UIImage *scaled =
                    [UIImage imageWithCGImage:self.CGImage scale:self.scale * ratio orientation:self.imageOrientation];
    CGFloat x = (scaled.size.width - size.width) / 2, y = (scaled.size.height - size.height) / 2;
    [scaled drawAtPoint:CGPointMake(-x, -y)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)jf_centeredCropWithSize:(CGSize)size radius:(CGFloat)radius
{
    // resize image if needed
    CGFloat scale  = UIScreen.mainScreen.scale;
    CGFloat ratio  = MAX(size.width * scale / self.size.width, size.height * scale / self.size.height);
    CGSize resized = CGSizeApplyAffineTransform(self.size, CGAffineTransformMakeScale(ratio, ratio));
    resized.width  = ceil(resized.width);
    resized.height = ceil(resized.height);

    UIGraphicsBeginImageContextWithOptions(resized, YES, 1);
    [self drawInRect:CGRectMake(0, 0, resized.width, resized.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGFloat x = (resized.width - size.width * scale) / 2, y = (resized.height - size.height * scale) / 2;
    image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(
                    image.CGImage, CGRectMake(x, y, size.width * scale, size.height * scale))
                                scale:self.scale
                          orientation:self.imageOrientation];
    return image;
}

- (UIImage *)jf_circleImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}
@end
