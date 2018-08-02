// UIImage+JFCompress.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIImage (JFCompress)

- (NSData *)jf_compressedJPEGImageData;

+ (UIImage *)jf_compressedImage:(UIImage *)image maxDataSize:(NSUInteger)dataSize;

/**
 *  解压缩图片到 size 大小
 *
 *  @param targetSize 解压缩后尺寸
 *
 *  @return 解压缩到 size 尺寸的图片
 */
- (UIImage *)jf_decompressWithSize:(CGSize)targetSize;

- (NSData *)jf_compressedImageDataForShare;
@end
