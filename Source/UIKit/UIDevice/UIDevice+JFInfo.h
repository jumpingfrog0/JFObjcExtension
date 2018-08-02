//
//  UIDevice+JFInfo.h
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

@interface UIDevice (JFInfo)
/**
 * 设备的网络状态
 * @return 返回网络状态，2G/3G/4G/wifi/notReachable
 */
//+ (NSString *)jf_network;

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
