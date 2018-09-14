//  UIImageView+MZDSDWebImageWrapper.h
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

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, MZDSDWebImageOptions) {
    /**
     * 当下载失败时，URL 默认会被进入到黑名单，以后不会再尝试下载。
     * 该 flag 表示禁用黑名单
     */
    MZDSDWebImageRetryFailed = 1 << 0,
    
    /**
     * image 默认在 UI 交互过程中开始下载,
     * 该 flag 禁用这个特性, 将 image 延迟到 UIScrollView 实例减速时开始下载
     */
    MZDSDWebImageLowPriority = 1 << 1,
    
    /**
     * 该 flag 禁用磁盘缓存
     */
    MZDSDWebImageCacheMemoryOnly = 1 << 2,
    
    /**
     * 该 flag 启用渐进下载, 图片在下载的过程中会像浏览器上的体验一样, 渐进显示出来
     * 默认情况下, 图片只有在完全下载完成以后才会显示
     */
    MZDSDWebImageProgressiveDownload = 1 << 3,
    
    /**
     * 就算 image 已经被缓存过, 仍然遵循 HTTP 响应缓存控制, 并在有必要的时候从远端更新 image.
     * 磁盘缓存的处理权将由 NSURLCache 来替代 SDWebImage, 会降低一点点性能.
     * 此选项会可以协助处理在相同请求 URL 下的图片更新, 比如: facebook graph api profile pics.
     * 假如缓存图片更新了, completion block 会在 cached image 时调用一次, 并在 final image 时再调用一次
     *
     * 只有在你不能通过嵌入缓存参数使 URLs 静态化的时才使用这个 flag
     */
    MZDSDWebImageRefreshCached = 1 << 4,
    
    /**
     * iOS 4 以上系统, 在应用进入后台时继续图片下载. 通过向系统请求额外后台时间来保证请求完成. 如果后台任务过期,操作会被取消.
     */
    MZDSDWebImageContinueInBackground = 1 << 5,
    
    /**
     * 通过设置
     * NSMutableURLRequest.HTTPShouldHandleCookies = YES;
     * 来处理储存在 NSHTTPCookieStore 中的 cookies
     */
    MZDSDWebImageHandleCookies = 1 << 6,
    
    /**
     * 开启允许不受信任的 SSL 证书. 用于测试目的, 生产环境慎用
     */
    MZDSDWebImageAllowInvalidSSLCertificates = 1 << 7,
    
    /**
     * 默认情况下, 图片加载顺序是其加入队列的顺序. 此 flag 会将图片提到队列的前面.
     */
    MZDSDWebImageHighPriority = 1 << 8,
    
    /**
     * 默认情况下, 占位图会在图片加载的同时加载. 该 flag 将延迟占位图到图片加载完成时才加载.
     */
    MZDSDWebImageDelayPlaceholder = 1 << 9,
    
    /**
     * 我们通常不会在动态图片组中调用 transformDownloadedImage 代理方法, 是因为大多数转换代码会损坏图片.
     * 使用该 flag 表示开启转换
     */
    MZDSDWebImageTransformAnimatedImage = 1 << 10,
    
    /**
     * 默认情况下, 图片会在下载完成后添加到 imageView. 但是在某些情况下, 我们希望在设置图片之前可以做一些事情（应用过滤器或者添加淡入淡出效果）
     * 如果想在加载成功后手动设置图片, 可以使用该 flag
     */
    MZDSDWebImageAvoidAutoSetImage = 1 << 11,
    
    /**
     * 该 flag 用于标识一个需要删掉 query 部分的 URL, 可用来作为缓存 image 的 key
     * eg. 获取短视频帧缩略图的 URL 使用时间戳防盗链加密, 每次加载同一张短视频缩略图的 URL 是不同的, 若有此 flag 则在传入的 URL 后拼接一个标识，如遇到此标识则需去掉 URL 中所有的 query 部分和该标识
     */
    MZDSDWebImageSpliceIgnoreParameters = 1 << 12
};

typedef void(^MZDSDWebImageCompletionBlock)(UIImage *image, NSError *error, NSURL *imageURL);
typedef void(^MZDSDWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);
typedef void(^MZDSDWebImageCompletionWithFinishedBlock)(UIImage *image, NSError *error, BOOL finished, NSURL *imageURL);

typedef UIImage *(^MZDSDWebImageTransformBlock)(UIImage *image);

@interface UIImageView (MZDSDWebImageWrapper)

/**
 * Get the current image URL.
 *
 * Note that because of the limitations of categories this property can get out of sync
 * if you use sd_setImage: directly.
 */
- (NSURL *)jf_imageURL;

/**
 * Set the imageView `image` with an `url`.
 *
 * The download is asynchronous and cached.
 *
 * @param url The url for the image.
 */
- (void)jf_setImageWithURL:(NSURL *)url;

/**
 * Set the imageView `image` with an `url`. if async is YES, call 'jf_setImageWithURL:'
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url for the image.
 */
- (void)jf_setImageWithURL:(NSURL *)url async:(BOOL)async;

/**
 * Set the imageView `image` with an `url` and a placeholder.
 *
 * The download is asynchronous and cached.
 *
 * @param url         The url for the image.
 * @param placeholder The image to be set initially, until the image request finishes.
 * @see sd_setImageWithURL:placeholderImage:options:
 */
- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

/**
 * Set the imageView `image` with an `url`, placeholder and custom options.
 *
 * The download is asynchronous and cached.
 *
 * @param url         The url for the image.
 * @param placeholder The image to be set initially, until the image request finishes.
 * @param options     The options to use when downloading the image. @see SDWebImageOptions for the possible values.
 */
- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(MZDSDWebImageOptions)options;

/**
 * Set the imageView `image` with an `url`.
 *
 * The download is asynchronous and cached.
 *
 * @param url            The url for the image.
 * @param completedBlock A block called when operation has been completed. This block has no return value
 *                       and takes the requested UIImage as first parameter. In case of error the image parameter
 *                       is nil and the second parameter may contain an NSError. The third parameter is a Boolean
 *                       indicating if the image was retrieved from the local cache or from the network.
 *                       The fourth parameter is the original image url.
 */
- (void)jf_setImageWithURL:(NSURL *)url completed:(MZDSDWebImageCompletionBlock)completedBlock;

/**
 * Set the imageView `image` with an `url`, placeholder.
 *
 * The download is asynchronous and cached.
 *
 * @param url            The url for the image.
 * @param placeholder    The image to be set initially, until the image request finishes.
 * @param completedBlock A block called when operation has been completed. This block has no return value
 *                       and takes the requested UIImage as first parameter. In case of error the image parameter
 *                       is nil and the second parameter may contain an NSError. The third parameter is a Boolean
 *                       indicating if the image was retrieved from the local cache or from the network.
 *                       The fourth parameter is the original image url.
 */
- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(MZDSDWebImageCompletionBlock)completedBlock;

/**
 * Set the imageView `image` with an `url`, placeholder and custom options.
 *
 * The download is asynchronous and cached.
 *
 * @param url            The url for the image.
 * @param placeholder    The image to be set initially, until the image request finishes.
 * @param options        The options to use when downloading the image. @see SDWebImageOptions for the possible values.
 * @param completedBlock A block called when operation has been completed. This block has no return value
 *                       and takes the requested UIImage as first parameter. In case of error the image parameter
 *                       is nil and the second parameter may contain an NSError. The third parameter is a Boolean
 *                       indicating if the image was retrieved from the local cache or from the network.
 *                       The fourth parameter is the original image url.
 */
- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(MZDSDWebImageOptions)options completed:(MZDSDWebImageCompletionBlock)completedBlock;

/**
 * Set the imageView `image` with an `url`, placeholder and custom options.
 *
 * The download is asynchronous and cached.
 *
 * @param url            The url for the image.
 * @param placeholder    The image to be set initially, until the image request finishes.
 * @param options        The options to use when downloading the image. @see SDWebImageOptions for the possible values.
 * @param progressBlock  A block called while image is downloading
 * @param completedBlock A block called when operation has been completed. This block has no return value
 *                       and takes the requested UIImage as first parameter. In case of error the image parameter
 *                       is nil and the second parameter may contain an NSError. The third parameter is a Boolean
 *                       indicating if the image was retrieved from the local cache or from the network.
 *                       The fourth parameter is the original image url.
 */
- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(MZDSDWebImageOptions)options progress:(MZDSDWebImageDownloaderProgressBlock)progressBlock completed:(MZDSDWebImageCompletionBlock)completedBlock;

/**
 * Set the imageView `image` with an `url` and optionally a placeholder image.
 *
 * The download is asynchronous and cached.
 *
 * @param url            The url for the image.
 * @param placeholder    The image to be set initially, until the image request finishes.
 * @param options        The options to use when downloading the image. @see SDWebImageOptions for the possible values.
 * @param progressBlock  A block called while image is downloading
 * @param completedBlock A block called when operation has been completed. This block has no return value
 *                       and takes the requested UIImage as first parameter. In case of error the image parameter
 *                       is nil and the second parameter may contain an NSError. The third parameter is a Boolean
 *                       indicating if the image was retrieved from the local cache or from the network.
 *                       The fourth parameter is the original image url.
 */
- (void)jf_setImageWithPreviousCachedImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(MZDSDWebImageOptions)options progress:(MZDSDWebImageDownloaderProgressBlock)progressBlock completed:(MZDSDWebImageCompletionBlock)completedBlock;

- (void)jf_setImageWithURL:(NSURL *)url transformBlock:(MZDSDWebImageTransformBlock)transformBlock;
- (void)jf_setImageWithURL:(NSURL *)url transformBlock:(MZDSDWebImageTransformBlock)transformBlock completed:(MZDSDWebImageCompletionBlock)completedBlock;
- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder transformBlock:(MZDSDWebImageTransformBlock)transformBlock completed:(MZDSDWebImageCompletionBlock)completedBlock;
- (void)jf_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(MZDSDWebImageOptions)options progress:(MZDSDWebImageDownloaderProgressBlock)progressBlock transformBlock:(MZDSDWebImageTransformBlock)transformBlock completed:(MZDSDWebImageCompletionBlock)completedBlock;


/**
 * Download an array of images and starts them in an animation loop
 *
 * @param arrayOfURLs An array of NSURL
 */
- (void)jf_setAnimationImagesWithURLs:(NSArray *)arrayOfURLs;

/**
 * Cancel the current download
 */
- (void)jf_cancelCurrentImageLoad;

- (void)jf_cancelCurrentAnimationImagesLoad;

@end
