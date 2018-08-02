//
// UIView+JFScreenshot.m
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import "UIView+JFScreenshot.h"

@implementation UIView (JFScreenshot)
//获得屏幕图像
- (UIImage *)jf_screenShot;
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return theImage;
}

//获得某个范围内的屏幕图像
- (UIImage *)jf_screenShotWithRect:(CGRect)rect;
{
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return  theImage;
}
@end
