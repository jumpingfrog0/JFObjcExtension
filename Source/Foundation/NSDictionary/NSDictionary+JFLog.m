//
//  NSDictionary+JFLog.m
//  ObjcExtension
//
//  Created by sheldon on 25/10/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "NSDictionary+JFLog.h"

@implementation NSDictionary (JFLog)
/**
 * NSLog格式化打印支持UTF8编码
 * 参考：http://www.jianshu.com/p/4ce287f0c2c3
 */
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *strM = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [strM appendString:@"{\n"];
    NSArray *allKey = self.allKeys;
    for (int i = 0; i < allKey.count; i++) {
        id value = self[allKey[i]];
        NSString *lastSymbol = (allKey.count == i + 1) ? @";":@";";
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [strM appendFormat:@"\t%@%@ = %@%@\n",tab, allKey[i], [value descriptionWithLocale:locale indent:level + 1], lastSymbol];
        } else {
            [strM appendFormat:@"\t%@%@ = %@%@\n",tab, allKey[i], value, lastSymbol];
        }
    }
    [strM appendFormat:@"%@}",tab];
    return strM;
}

@end
