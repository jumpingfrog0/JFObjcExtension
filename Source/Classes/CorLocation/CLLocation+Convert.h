//
//  CLLocation+Convert.h
//  ObjcExtension
//
//  Created by jumpingfrog0 on 2017/10/15.
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

#import <CoreLocation/CoreLocation.h>

/**
 * 火星坐标系转换扩展
 * earth（国外 WGS84）, mars（国内 GCJ-02）, bearPaw（百度 BD-09） 坐标系间相互转换
 * 未包含 mars2earth. 需要这个可参考 http://xcodev.com/131.html
 *
 * @see https://gist.github.com/zvving/5476132
 */
@interface CLLocation (Convert)

- (CLLocation*)locationMarsFromEarth;
//- (CLLocation*)locationEarthFromMars; // 未实现

- (CLLocation*)locationBearPawFromMars;
- (CLLocation*)locationMarsFromBearPaw;

@end
