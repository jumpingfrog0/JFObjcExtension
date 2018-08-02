//
//  UIImageView+MZDLocalPathCache.m
//  iLoving
//
//  Created by Yury on 13-7-10.
//  Copyright (c) 2013年 MZD. All rights reserved.
//

#import "UIImageView+MZDLocalPathCache.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache+MZDLocalPathCacheSupport.h"

@implementation UIImageView (MZDLocalPathCache)

- (void)jf_setImageWithPath:(NSString *)path async:(BOOL)async
{
    if (async) {
        [self jf_setImageWithPath:path];
    }
    else {
        NSURL *url = [NSURL URLWithString:kMZDSDWebCacheLocalhost];
        url = [url URLByAppendingPathComponent:path];
        self.image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:url.absoluteString];
    }
}


- (void)jf_setImageWithPath:(NSString *)path
{
    [self jf_setImageWithPath:path placeholderImage:nil completed:nil];
}

- (void)jf_setImageWithPath:(NSString *)path placeholderImage:(UIImage *)placeholder
{
    [self jf_setImageWithPath:path placeholderImage:placeholder completed:nil];
}

- (void)jf_setImageWithPath:(NSString *)path completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self jf_setImageWithPath:path placeholderImage:nil completed:completedBlock];
}

- (void)jf_setImageWithPath:(NSString *)path placeholderImage:(UIImage *)placeholder completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self jf_cancelCurrentImageLoad];
    
    self.image = placeholder;

    NSURL *url = [NSURL URLWithString:kMZDSDWebCacheLocalhost];
    url = [url URLByAppendingPathComponent:path];
    [self jf_setImageWithURL:url placeholderImage:placeholder options:MZDSDWebImageRetryFailed progress:nil completed:completedBlock];
}

@end
