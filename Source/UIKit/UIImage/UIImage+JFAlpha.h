// UIImage+JFAlpha.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIImage (JFAlpha)
- (BOOL)jf_hasAlpha;
- (UIImage *)jf_imageWithAlpha;
- (UIImage *)jf_transparentBorderImage:(NSUInteger)borderSize;
@end
