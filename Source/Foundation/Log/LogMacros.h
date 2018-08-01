//
//  NSArray+Log.h
//  ObjcExtension
//
//  Created by jumpingfrog0 on 27/07/2017.
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

#ifndef ObjcExtension_LogMacros_h
#define ObjcExtension_LogMacros_h

// 日志输出
#ifdef DEBUG
    #define NSLog(format, ...) do { \
        NSString *filePath = [[NSString alloc] initWithBytes:__FILE__ length:strlen(__FILE__) encoding:NSUTF8StringEncoding]; \
        NSString *origin = [[NSString alloc] initWithFormat:(format), ##__VA_ARGS__ ]; \
        (NSLog)(@"%@[%d] %s %@",[filePath lastPathComponent], __LINE__, __PRETTY_FUNCTION__, origin); \
    } while(0)
#else
    #define NSLog(format, ...)
#endif

// 日志输出
#ifdef DEBUG
#define JFLog(format, ...) do { \
NSString *filePath = [[NSString alloc] initWithBytes:__FILE__ length:strlen(__FILE__) encoding:NSUTF8StringEncoding]; \
NSString *origin = [[NSString alloc] initWithFormat:(format), ##__VA_ARGS__ ]; \
(NSLog)(@"%@[%d] %s %@",[filePath lastPathComponent], __LINE__, __PRETTY_FUNCTION__, origin); \
} while(0)
#endif

#endif
