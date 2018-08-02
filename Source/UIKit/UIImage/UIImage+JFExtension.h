//
//  UIImage+Extend.h
//  ObjcExtension
//
//  Created by jumpingfrog0 on 27/07/2017.
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

FOUNDATION_EXPORT NSString *const kMZDSaveImageToPhotosAlbumSuccessNotification;
FOUNDATION_EXPORT NSString *const kMZDSaveImageToPhotosAlbumFailureNotification;

@interface UIImage (JFExtension)

+ (instancetype)jf_generateWithWatermark:(UIImage *)watermark ForImage:(UIImage *)image;
+ (UIImage *)jf_resizableImageNamed:(NSString *)name;

/**
 * 从 bundle 中加载 image
 * @param imageName 图片名称
 * @param bundleName 包名
 * @return bundle 中存在 返回 UIImage，否则返回 nil
 */
+ (UIImage *)jf_imageNamed:(NSString *)imageName inBundle:(NSString *)bundleName;

#pragma mark - snapshot

//获得屏幕图像
+ (UIImage *)jf_imageFromView:(UIView *)view;

//获得某个范围内的屏幕图像
+ (UIImage *)jf_imageFromView:(UIView *)view inRect:(CGRect)rect;

#pragma mark - save

- (void)jf_saveToPhotosAlbum;

#pragma mark - rotate

- (UIImage *)jf_imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)jf_imageRotatedByDegrees:(CGFloat)degrees;
@end
