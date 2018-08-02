//  UIImage+JFFilter.m
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

#import "UIImage+JFFilter.h"

@implementation UIImage (JFFilter)
- (UIImage*)jf_grayScaleImage {
    CGFloat scale = [[UIScreen mainScreen] scale];
    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, self.size.width * scale, self.size.height * scale);
    // Grayscale color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    // Create bitmap content with current image size and grayscale colorspace
    CGContextRef context = CGBitmapContextCreate(nil, self.size.width * scale, self.size.height * scale, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);
    // Draw image into current context, with specified rectangle
    // using previously defined context (with grayscale colorspace)
    CGContextDrawImage(context, imageRect, [self CGImage]);
    // Create bitmap image info from pixel data in current context
    CGImageRef grayImage = CGBitmapContextCreateImage(context);
    // release the colorspace and graphics context
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    // make a new alpha-only graphics context
    context = CGBitmapContextCreate(nil, self.size.width * scale, self.size.height * scale, 8, 0, nil, (CGBitmapInfo)kCGImageAlphaOnly);
    // draw image into context with no colorspace
    CGContextDrawImage(context, imageRect, [self CGImage]);
    // create alpha bitmap mask from current context
    CGImageRef mask = CGBitmapContextCreateImage(context);
    // release graphics context
    CGContextRelease(context);
    // make UIImage from grayscale image with alpha mask
    CGImageRef grayScale = CGImageCreateWithMask(grayImage, mask);
    UIImage *grayScaleImage = [UIImage imageWithCGImage:grayScale scale:self.scale orientation:self.imageOrientation];
    // release the CG images
    CGImageRelease(grayScale);
    CGImageRelease(grayImage);
    CGImageRelease(mask);
    // return the new grayscale image
    return grayScaleImage;
}

- (UIImage *)jf_imageWithMask:(UIImage *)maskImage {
    CGImageRef maskRef = maskImage.CGImage;

    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
            CGImageGetHeight(maskRef),
            CGImageGetBitsPerComponent(maskRef),
            CGImageGetBitsPerPixel(maskRef),
            CGImageGetBytesPerRow(maskRef),
            CGImageGetDataProvider(maskRef), NULL, false);

    CGImageRef maskedImageRef = CGImageCreateWithMask([self CGImage], mask);
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedImageRef];

    CGImageRelease(mask);
    CGImageRelease(maskedImageRef);

    return maskedImage;
}

- (UIImage *)jf_tintedImageWithColor:(UIColor *)tintColor
{
    CGRect drawRect = CGRectMake(0, 0, self.size.width, self.size.height);

    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    [self drawInRect:drawRect];
    [tintColor set];
    UIRectFillUsingBlendMode(drawRect, kCGBlendModeSourceAtop);
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return tintedImage;
}

- (UIImage *)jf_hollowOutWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0];

    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return tintedImage;
}

@end
