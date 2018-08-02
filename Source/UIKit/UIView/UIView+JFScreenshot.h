//
// UIView+JFScreenshot.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIView (JFScreenshot)
/**
 *  生成 view 屏幕截图
 *
 *  @return 屏幕截图图片
 */
- (UIImage *)jf_screenShot;

/**
 *  生成 view 的 rect 范围内的屏幕截图
 *
 *  @param rect 截图范围
 *
 *  @return 屏幕截图图片
 */
- (UIImage *)jf_screenShotWithRect:(CGRect)rect;
@end
