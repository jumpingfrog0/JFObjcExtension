//
//  NSDictionaryTestController.m
//  ObjcExtension
//
//  Created by sheldon on 25/10/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "NSDictionaryTestController.h"

@interface NSDictionaryTestController ()

@end

@implementation NSDictionaryTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dict = @{
                     @"键一" : @"中国",
                     @"键二" : @"美国"
                     };
    
    NSLog(@"%@", dict);
}

@end
