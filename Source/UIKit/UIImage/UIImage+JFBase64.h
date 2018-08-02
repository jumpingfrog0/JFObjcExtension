// UIImage+JFBase64.h
// Pods
//
// Created by sheldon on 2018/6/27.
//

#import <UIKit/UIKit.h>

@interface UIImage (JFBase64)
- (NSString *)jf_base64DataString;
+ (UIImage *)jf_imageFromBase64EncodedString:(NSString *)base64String;
@end
