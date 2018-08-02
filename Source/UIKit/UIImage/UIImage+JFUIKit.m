//
//  UIImage+JFUIKit.m
//  MZDUIKit
//
//  Created by sheldon on 2018/6/27.
//

#import "UIImage+JFUIKit.h"
#import "NSBundle+JFUIKit.h"

@implementation UIImage (JFUIKit)
+ (UIImage *)jf_imageNamedInMZDUIKitBundle:(NSString *)imageName {
    NSBundle *bundle = [NSBundle jf_UIKit_bundle];
    return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
}
@end
