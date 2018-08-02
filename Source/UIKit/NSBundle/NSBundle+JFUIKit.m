//
//  NSBundle+JFUIKit.m
//  MZDUIKit
//
//  Created by sheldon on 2018/6/27.
//

#import "NSBundle+JFUIKit.h"

@implementation NSBundle (JFUIKit)
+ (instancetype)jf_UIKit_bundle {
    NSString *mainBundlePath = [NSBundle mainBundle].bundlePath;
    NSString *bundlePath = [NSString stringWithFormat:@"%@/%@",mainBundlePath,@"MZDUIKit.bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    if (!bundle) {
        bundlePath = [NSString stringWithFormat:@"%@/%@",mainBundlePath,@"Frameworks/MZDUIKit.framework/MZDUIKit.bundle"];
        bundle = [NSBundle bundleWithPath:bundlePath];
    }
    return bundle;
}
@end
