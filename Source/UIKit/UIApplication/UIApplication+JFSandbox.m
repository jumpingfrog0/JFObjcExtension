//
// UIApplication+JFSandbox.m
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import "UIApplication+JFSandbox.h"

@implementation UIApplication (JFSandbox)
+ (NSURL *)jf_documentsDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)jf_cachesDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)jf_downloadsDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDownloadsDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)jf_libraryDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)jf_applicationSupportDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSString *)jf_documentsDirectoryPath
{
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return directories[0];
}

+ (NSString *)jf_cachesDirectoryPath
{
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return directories[0];
}

+ (NSString *)jf_downloadsDirectoryPath
{

    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
    return directories[0];
}

+ (NSString *)jf_libraryDirectoryPath
{

    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return directories[0];
}

+ (NSString *)jf_applicationSupportDirectoryPath
{

    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    return directories[0];
}
@end
