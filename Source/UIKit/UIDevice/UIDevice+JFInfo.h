//
// UIDevice+JFInfo.h
//
// Created by sheldon on 10/10/2017.
// Copyright (c) 2017 jumpingfrog0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (JFInfo)
/**
 * 设备的网络状态
 * @return 返回网络状态，2G/3G/4G/wifi/notReachable
 */
+ (NSString *)jf_network;

/**
 *  设备的 mac 地址
 *
 *  @return 返回格式为 0f:0f:0f:0f:0f:0f
 */
+ (NSString *)jf_mac;

/*
 * mobileNetworkCode
 *
 * Discussion:
 *   An NSString containing the  mobile network code for the subscriber's
 *   cellular service provider, in its numeric representation
 */
+ (NSString *)jf_mobileNetworkCode;

/**
 *  设备的 advertisingIdentifier
 *
 *  @return 返回 advertisingIdentifier UUIDString，若不支持 adsupport 返回 @"",
 */
+ (NSString *)jf_idfa;

/**
 *  设备的 identifierForVendor
 *
 *  @return 返回 identifierForVendor UUIDString, 若不支持返回 @""
 */
+ (NSString *)jf_idfv;

/**
 *  struct	utsname 下 machine 即设备的 model, 如 iPod5.1
 *
 *  @return 设备的 model 型号
 */
+ (NSString *)jf_model;

- (NSString *)jf_uuid;

/**
 *  设备是否越狱，判断 cydia.app
 *
 *  @return 越狱返回 YES，反之 NO
 */
+ (BOOL)jf_isJailBroken;

/**
 * 当前App版本号
 */
+ (NSString *)jf_appVersion;

/**
 *  设备系统版本在 version 版本之上
 *
 *  @param version 参照版本号 如 7.1
 *
 *  @return 当前系统版本比参照版本高返回 YES， 反之 NO
 */
+ (BOOL)jf_uponVersion:(CGFloat)version;

/**
 *  设备系统版本在 version 版本以下
 *
 *  @param version 参照版本号 如 7.1
 *
 *  @return 当前系统版本比参照版本低返回 YES， 反之 NO
 */
+ (BOOL)jf_underVersion:(CGFloat)version;

/**
 * 设备是否是 iPhone X
 * @return iPhone X 返回 YES，反之 NO
 */
+ (BOOL)jf_isiPhoneX;

/**
 * 设备是否是 iPhone Plus
 * @return 是 Plus 返回 YES, 反之
 */
+ (BOOL)jf_isPlus;
@end