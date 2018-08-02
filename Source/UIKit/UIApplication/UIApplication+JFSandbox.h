//
//  UIApplication+JFSandbox.h
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
