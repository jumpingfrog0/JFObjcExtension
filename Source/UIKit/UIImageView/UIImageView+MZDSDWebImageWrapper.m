// UIImageView+MZDSDWebImageWrapper.m
// Pods
//
// Created by sheldon on 2018/6/27.
//

#import "UIImageView+MZDSDWebImageWrapper.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (MZDSDWebImageWrapper)
- (NSURL *)jf_imageURL
{
    return [self sd_imageURL];
}

- (void)jf_setImageWithURL:(NSURL *)url
{
    [self jf_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)jf_setImageWithURL:(NSURL *)url async:(BOOL)async
{
    if (async) {
        [self jf_setImageWithURL:url];
    }
    else {
        self.image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:url.absoluteString];
    }
}

- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self jf_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(MZDSDWebImageOptions)options
{
    [self jf_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)jf_setImageWithURL:(NSURL *)url completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self jf_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}

- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self jf_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}

- (void)jf_setImageWithURL:(NSURL *)url
           placeholderImage:(UIImage *)placeholder
                    options:(MZDSDWebImageOptions)options
                  completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self jf_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)jf_setImageWithURL:(NSURL *)url
           placeholderImage:(UIImage *)placeholder
                    options:(MZDSDWebImageOptions)options
                   progress:(MZDSDWebImageDownloaderProgressBlock)progressBlock
                  completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    if (options & MZDSDWebImageSpliceIgnoreParameters) {
        NSString *urlStr = url.absoluteString;
        url = [NSURL URLWithString:[urlStr stringByAppendingString:@"&mzdignore=1"]];
    }
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:(SDWebImageOptions)options
                    progress:progressBlock
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (completedBlock) {
                           completedBlock(image, error, imageURL);
                       }
                   }];
}

- (void)jf_setImageWithPreviousCachedImageWithURL:(NSURL *)url
                                  placeholderImage:(UIImage *)placeholder
                                           options:(MZDSDWebImageOptions)options
                                          progress:(MZDSDWebImageDownloaderProgressBlock)progressBlock
                                         completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self sd_setImageWithPreviousCachedImageWithURL:url
                                   placeholderImage:placeholder
                                            options:(SDWebImageOptions)options
                                           progress:progressBlock
                                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                              if (completedBlock) {
                                                  completedBlock(image, error, imageURL);
                                              }
                                          }];
}

- (void)jf_setImageWithURL:(NSURL *)url transformBlock:(MZDSDWebImageTransformBlock)transformBlock
{
    [self jf_setImageWithURL:url placeholderImage:nil options:MZDSDWebImageRetryFailed | MZDSDWebImageAvoidAutoSetImage progress:nil transformBlock:transformBlock completed:nil];
}

- (void)jf_setImageWithURL:(NSURL *)url transformBlock:(MZDSDWebImageTransformBlock)transformBlock completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self jf_setImageWithURL:url placeholderImage:nil options:MZDSDWebImageRetryFailed | MZDSDWebImageAvoidAutoSetImage progress:nil transformBlock:transformBlock completed:completedBlock];
}

- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder transformBlock:(MZDSDWebImageTransformBlock)transformBlock completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    [self jf_setImageWithURL:url placeholderImage:placeholder options:MZDSDWebImageRetryFailed | MZDSDWebImageAvoidAutoSetImage progress:nil transformBlock:transformBlock completed:completedBlock];
}


- (void)jf_setImageWithURL:(NSURL *)url
           placeholderImage:(UIImage *)placeholder
                    options:(MZDSDWebImageOptions)options
                   progress:(MZDSDWebImageDownloaderProgressBlock)progressBlock
             transformBlock:(MZDSDWebImageTransformBlock)transformBlock
                  completed:(MZDSDWebImageCompletionBlock)completedBlock
{
    __weak UIImageView *wself = self;
    [self jf_setImageWithURL:url
             placeholderImage:placeholder
                      options:options | MZDSDWebImageAvoidAutoSetImage
                     progress:progressBlock
                    completed:^(UIImage *image, NSError *error, NSURL *imageURL) {
                        __block UIImage *processedImage = nil;
                        if (image) {
                            if (transformBlock) {
                                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                    processedImage = transformBlock(image);
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        wself.image = processedImage ? processedImage : image;
                                        [wself setNeedsLayout];
                                        
                                        if (completedBlock) {
                                            completedBlock(processedImage ?: image, error, imageURL);
                                        }
                                    });
                                });
                                return;
                            }
                            else {
                                wself.image = image;
                                [wself setNeedsLayout];
                            }
                        }
                        if (completedBlock) {
                            completedBlock(image, error, imageURL);
                        }
                    }];
}


- (void)jf_setAnimationImagesWithURLs:(NSArray *)arrayOfURLs
{
    [self sd_setAnimationImagesWithURLs:arrayOfURLs];
}

- (void)jf_cancelCurrentImageLoad
{
    [self sd_cancelCurrentImageLoad];
}

- (void)jf_cancelCurrentAnimationImagesLoad
{
    [self sd_cancelCurrentAnimationImagesLoad];
}


@end
