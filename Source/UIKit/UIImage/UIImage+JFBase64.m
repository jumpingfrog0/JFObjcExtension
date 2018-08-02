// UIImage+JFBase64.m
// Pods
//
// Created by sheldon on 2018/6/27.
//

#import "UIImage+JFBase64.h"

@implementation UIImage (JFBase64)
- (NSString *)jf_base64DataString {
    NSData *imageData = UIImageJPEGRepresentation(self, 0.0);
    NSString *prefix = @"data:image/jpeg;base64,";
    NSString *base64String = [imageData base64EncodedStringWithOptions:0];
    return [prefix stringByAppendingString:base64String];
}

+ (UIImage *)jf_imageFromBase64EncodedString:(NSString *)base64String {
    if (!base64String) {
        return nil;
    }
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
@end
