//
// UIView+JFExtension.m
//
// Created by sheldon on 28/09/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import "UIView+JFExtension.h"
#import "UIImage+JFExtension.h"

@implementation UIView (JFExtension)
- (void)jf_setTopLineWithColor:(UIColor *)color {
    CGRect frame = CGRectMake(0.0, 0.0, self.bounds.size.width, 1);
    UIImageView *imageView     = [[UIImageView alloc] initWithFrame:frame];
    imageView.backgroundColor  = color;
    [self addSubview:imageView];
}

- (void)jf_setTopLineWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat width = [UIScreen mainScreen].bounds.size.width < self.bounds.size.width ? [UIScreen mainScreen].bounds.size.width : self.bounds.size.width;
    CGRect frame = CGRectMake(0.0, 0.0, width, image.size.height);
    UIImageView *imageView     = [[UIImageView alloc] initWithFrame:frame];
    imageView.backgroundColor  = [UIColor clearColor];
    imageView.image = [UIImage jf_resizableImageNamed:imageName];
    [self addSubview:imageView];
}

- (void)jf_setBottomLineWithColor:(UIColor *)color {
    CGRect frame = CGRectMake(0.0, self.bounds.size.height, self.bounds.size.width, 1);
    UIImageView *imageView     = [[UIImageView alloc] initWithFrame:frame];
    imageView.backgroundColor  = color;
    [self addSubview:imageView];
}

- (void)jf_setBottomLineWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat width = [UIScreen mainScreen].bounds.size.width < self.bounds.size.width ? [UIScreen mainScreen].bounds.size.width : self.bounds.size.width;
    CGRect frame = CGRectMake(0.0, self.bounds.size.height - 1, width, image.size.height);
    UIImageView *imageView     = [[UIImageView alloc] initWithFrame:frame];
    imageView.backgroundColor  = [UIColor clearColor];
    imageView.image = [UIImage jf_resizableImageNamed:imageName];
    [self addSubview:imageView];
}

- (void)jf_removeLayerAnimationsRecursively {
    [self.layer removeAllAnimations];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView *obj, NSUInteger idx, BOOL *stop) {
        [obj jf_removeLayerAnimationsRecursively];
    }];
}
@end
