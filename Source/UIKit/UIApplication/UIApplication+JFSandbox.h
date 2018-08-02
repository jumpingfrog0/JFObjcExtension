//
// UIApplication+JFSandbox.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

@interface UIApplication (JFSandbox)
/**
 *  获取当前应用程序 sandbox 的 Documents 文件 URL
 *
 *  @return Documents URL
 */
+ (NSURL *)jf_documentsDirectoryURL;

/**
 *  获取当前应用程序 sandbox 的 Caches 文件 URL
 *
 *  @return Caches URL
 */
+ (NSURL *)jf_cachesDirectoryURL;

/**
 *  获取当前应用程序 sandbox 的 Downloads 文件 URL
 *
 *  @return Downloads URL
 */
+ (NSURL *)jf_downloadsDirectoryURL;

/**
 *  获取当前应用程序 sandbox 的 Library 文件 URL
 *
 *  @return Library URL
 */
+ (NSURL *)jf_libraryDirectoryURL;

/**
 * Returns the file URL of the application support directory.
 */
+ (NSURL *)jf_applicationSupportDirectoryURL;

/**
 *  获取当前应用程序 sandbox 的 Documents 文件 Path
 *
 *  @return Documents Path
 */
+ (NSString *)jf_documentsDirectoryPath;

/**
 *  获取当前应用程序 sandbox 的 Caches 文件 Path
 *
 *  @return Caches Path
 */
+ (NSString *)jf_cachesDirectoryPath;

/**
 *  获取当前应用程序 sandbox 的 Downloads 文件 Path
 *
 *  @return Downloads Path
 */
+ (NSString *)jf_downloadsDirectoryPath;

/**
 *  获取当前应用程序 sandbox 的 Library 文件 Path
 *
 *  @return Library Path
 */
+ (NSString *)jf_libraryDirectoryPath;
@end
