//
// UIDevice+JFInfo.m
//
// Created by sheldon on 10/10/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import "UIDevice+JFInfo.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <sys/utsname.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <AdSupport/AdSupport.h>

@implementation UIDevice (JFInfo)
//+ (NSString *)jf_network {
//    //为适配iPhoneX弃用通过状态栏获取当前的网络状态，改用Reachability
//    NSString *stateString = @"wifi";
//    switch ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus]) {
//        case NotReachable: {
//            stateString = @"notReachable";
//        }
//            break;
//        case ReachableVia2G: {
//            stateString = @"2G";
//        }
//            break;
//        case ReachableVia3G: {
//            stateString = @"3G";
//        }
//            break;
//        case ReachableVia4G: {
//            stateString = @"4G";
//        }
//            break;
//        case ReachableViaWiFi: {
//            stateString = @"wifi";
//        }
//            break;
//        default:
//            break;
//    }
//    return stateString;
//}

+ (NSString *)jf_mac
{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;

    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;

    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }

    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }

    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }

    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }

    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *macString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                                                     *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);

    return macString;
}

+ (NSString *)jf_mobileNetworkCode
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];

    CTCarrier *carrier = [info subscriberCellularProvider];

    NSString *mnc;

    if (!carrier.isoCountryCode) {
        mnc = @"";
    } else {
        mnc = [carrier mobileNetworkCode];
    }

    return mnc;
}

+ (NSString *)jf_idfa
{
    NSBundle *adSupportBundle = [NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"];
    [adSupportBundle load];

    if (adSupportBundle == nil) {
        return @"";
    }

    Class asIdentifierMClass = NSClassFromString(@"ASIdentifierManager");
    if (asIdentifierMClass == nil) {
        return @"";
    }

    ASIdentifierManager *asIM = [[ASIdentifierManager alloc] init];

    if (asIM == nil) {
        return @"";
    }
    if (asIM.advertisingTrackingEnabled) {
        return [asIM.advertisingIdentifier UUIDString];
    }

    return [asIM.advertisingIdentifier UUIDString];
}

+ (NSString *)jf_idfv
{
    if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[UIDevice currentDevice].identifierForVendor UUIDString];
    }

    return @"";
}

+ (NSString *)jf_model
{
    struct utsname sInfo;
    uname(&sInfo);
    NSString *machineName = [NSString stringWithCString:sInfo.machine encoding:NSUTF8StringEncoding];

    return machineName;
}

- (NSString *)jf_uuid
{
    return nil;
}

+ (BOOL)jf_isJailBroken
{
    BOOL cydia = NO;
    BOOL binBash = NO;
    NSString *filePath = @"/Applications/Cydia.app";
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        cydia = YES;
    }

    FILE * f = fopen("/bin/bash", "r");
    if (f != NULL) {
        binBash = YES;
    }
    fclose(f);

    if (cydia || binBash) {
        return YES;
    }
    return NO;
}

+ (NSString *)jf_appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (BOOL)jf_uponVersion:(CGFloat)version
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= version;
}

+ (BOOL)jf_underVersion:(CGFloat)version
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] < version;
}

+ (BOOL)jf_isiPhoneX {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //Simulator
    if ([platform isEqualToString:@"i386"])          return YES;
    if ([platform isEqualToString:@"x86_64"])        return YES;
    //iPhone
    if ([platform isEqualToString:@"iPhone10,3"])    return YES;
    if ([platform isEqualToString:@"iPhone10,6"])    return YES;
    return NO;
}

+ (BOOL)jf_isPlus
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    if (fabs(scale - 3.0) < 0.0001) {
        return YES;
    } else {
        return NO;
    }
}
@end
