//
//  NSArrayTestController.m
//  ObjcExtension
//
//  Created by sheldon on 25/10/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "NSArrayTestController.h"

@interface NSArrayTestController ()

@end

@implementation NSArrayTestController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *arr = @[
            @"中国",
            @"美国"
    ];

    NSLog(@"%@", arr);
}
@end
