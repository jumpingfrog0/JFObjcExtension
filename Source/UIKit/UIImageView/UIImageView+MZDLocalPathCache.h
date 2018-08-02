//
//  UIImageView+MZDLocalPathCache.h
//  iLoving
//
//  Created by Yury on 13-7-10.
//  Copyright (c) 2013年 MZD. All rights reserved.
//

#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIImageView+MZDSDWebImageWrapper.h"

@interface UIImageView (MZDLocalPathCache)
/**
 * Set the imageView `image` with an `url`. if async is YES, call 'jf_setImageWithPath:'
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url for the image.
 */
- (void)jf_setImageWithPath:(NSString *)path async:(BOOL)async;

/**
 * Set the imageView `image` with an `url`.
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url for the image.
 */
- (void)jf_setImageWithPath:(NSString *)path;

/**
 * Set the imageView `image` with an `url` and a placeholder.
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url for the image.
 * @param placeholder The image to be set initially, until the image request finishes.
 * @see setImageWithURL:placeholderImage:options:
 */
- (void)jf_setImageWithPath:(NSString *)path placeholderImage:(UIImage *)placeholder;

/**
 * Set the imageView `image` with an `url`.
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url for the image.
 * @param completedBlock A block called when operation has been completed. This block as no return value
 *                       and takes the requested UIImage as first parameter. In case of error the image parameter
 *                       is nil and the second parameter may contain an NSError. The third parameter is a Boolean
 *                       indicating if the image was retrived from the local cache of from the network.
 */
- (void)jf_setImageWithPath:(NSString *)path completed:(MZDSDWebImageCompletionBlock)completedBlock;

/**
 * Set the imageView `image` with an `url`, placeholder.
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url for the image.
 * @param placeholder The image to be set initially, until the image request finishes.
 * @param completedBlock A block called when operation has been completed. This block as no return value
 *                       and takes the requested UIImage as first parameter. In case of error the image parameter
 *                       is nil and the second parameter may contain an NSError. The third parameter is a Boolean
 *                       indicating if the image was retrived from the local cache of from the network.
 */
- (void)jf_setImageWithPath:(NSString *)path placeholderImage:(UIImage *)placeholder completed:(MZDSDWebImageCompletionBlock)completedBlock;



@end
