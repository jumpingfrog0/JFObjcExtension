//
// UIView+JFExtension.h
//
// Created by sheldon on 28/09/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JFExtension)

- (void)jf_setTopLineWithColor:(UIColor *)color;
- (void)jf_setTopLineWithImageName:(NSString *)imageName;
- (void)jf_setBottomLineWithColor:(UIColor *)color;
- (void)jf_setBottomLineWithImageName:(NSString *)imageName;

/**
 * 移除iOS11下搜索框的动画时，必须在 `viewDidAppear:` 中调用，且必须在调用 `becomeFirstResponder` 方法之后
 */
- (void)jf_removeLayerAnimationsRecursively;

@end
