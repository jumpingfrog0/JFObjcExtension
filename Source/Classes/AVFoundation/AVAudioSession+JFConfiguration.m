//
//  AVAudioSession+JFConfiguration.m
//  JFObjcExtension
//
//  Created by jumpingfrog0 on 2019/04/22.
//
//
//  Copyright © 2019 jumpingfrog0. All rights reserved.
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

#import <objc/runtime.h>
#import "AVAudioSession+JFConfiguration.h"

static char kAVAudioSessionPortOverrideCache;
static char kMuteButtonEnabledKey;

@implementation AVAudioSession (JFConfiguration)

- (AVAudioSessionPortOverride)jf_portOverride {
    return (AVAudioSessionPortOverride)[objc_getAssociatedObject(self, &kAVAudioSessionPortOverrideCache) unsignedIntegerValue];
}

- (void)setJf_portOverride:(AVAudioSessionPortOverride)portOverride {
    if (self.jf_portOverride != portOverride) {
        objc_setAssociatedObject(self, &kAVAudioSessionPortOverrideCache, @(portOverride), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (BOOL)jf_muteButtonEnabled {
    return [objc_getAssociatedObject(self, &kMuteButtonEnabledKey) boolValue];
}

- (void)setJf_muteButtonEnabled:(BOOL)enabled {
    objc_setAssociatedObject(self, &kMuteButtonEnabledKey, @(enabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self jf_changeConfig];
}

- (void)jf_initSession {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(jf_sessionRouteChanged:)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:nil];

    [self jf_resetConfig];
}

- (void)jf_resetConfig
{
    if (self.jf_muteButtonEnabled) {
        if (![self.category isEqualToString:AVAudioSessionCategorySoloAmbient]) {
            [self setCategory:AVAudioSessionCategorySoloAmbient error:nil];
        }
    } else {
        // 重置为不允许在后台播放声音
        if (![self.category isEqualToString:AVAudioSessionCategoryPlayAndRecord]) {
            [self setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        }
    }

}

- (void)jf_changeConfig {
    if (self.jf_muteButtonEnabled) {
        [self setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    } else {
        [self setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}

- (void)jf_changeAudioRouteToSpeaker
{
    [self setJf_portOverride:AVAudioSessionPortOverrideSpeaker];
    [self overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
}

- (void)jf_changeAudioRouteToReceiver
{
    [self setJf_portOverride:AVAudioSessionPortOverrideNone];
    [self overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:nil];
}

- (BOOL)jf_isReceiverAvailable
{
#if TARGET_IPHONE_SIMULATOR
    #warning *** Simulator mode: audio session code works only on a device
    return NO;
#else
    CFStringRef route;
    UInt32 propertySize = sizeof(CFStringRef);
    AudioSessionGetProperty(kAudioSessionProperty_AudioRoute, &propertySize, &route);

    if((route == NULL) || (CFStringGetLength(route) == 0)){
        // Silent Mode
        NSLog(@"AudioRoute: SILENT, do nothing!");
    } else {
        NSString* routeStr = (__bridge_transfer NSString *)route;
        NSRange receiverRange = [routeStr rangeOfString : @"Receiver"];
        if (receiverRange.location != NSNotFound) {
            return YES;
        }
    }
    return NO;
#endif
}

- (BOOL)jf_hasHeadset {
    for (AVAudioSessionPortDescription *desc in self.currentRoute.outputs) {
        if ([desc.portType isEqualToString:AVAudioSessionPortHeadphones]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark --
- (void)jf_sessionRouteChanged:(NSNotification *)notification
{
    NSInteger reason = [notification.userInfo[AVAudioSessionRouteChangeReasonKey] integerValue];

    if (reason == kAudioSessionRouteChangeReason_OldDeviceUnavailable ||
            reason == kAudioSessionRouteChangeReason_NewDeviceAvailable ||
            reason == kAudioSessionRouteChangeReason_NoSuitableRouteForCategory)
    {
        if (self.jf_hasHeadset) {
            [self overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:nil];
        }
        else {
            [self overrideOutputAudioPort:self.jf_portOverride error:nil];
        }
    }
}
@end
