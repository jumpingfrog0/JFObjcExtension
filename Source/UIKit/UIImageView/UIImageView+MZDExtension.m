//  UIImageView+MZDExtension.m
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2018/08/02.
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

#import "UIImageView+MZDExtension.h"
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "SDImageCache+MZDLocalPathCacheSupport.h"


@implementation UIImageView (MZDExtension)
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
    [self sd_cancelCurrentImageLoad];

    self.image = placeholder;

    NSURL *url = [NSURL URLWithString:kMZDSDWebCacheLocalhost];
    url = [url URLByAppendingPathComponent:path];
    [self jf_setImageWithURL:url placeholderImage:placeholder options:MZDSDWebImageRetryFailed progress:nil completed:completedBlock];
}
@end
