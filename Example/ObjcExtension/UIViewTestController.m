//
//  UIViewTestController.m
//  ObjcExtension
//
//  Created by sheldon on 29/09/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "UIViewTestController.h"
#import "UIView+JFExtension.h"
#import "UIView+Drawing.h"
#import "UIView+JFBlur.h"

@interface UIViewTestController ()
@property(nonatomic, strong) IBOutlet UIView *view1;
@property(nonatomic, strong) IBOutlet UIView *view2;
@property(nonatomic, strong) IBOutlet UIView *view3;
@property(nonatomic, strong) IBOutlet UIView *view4;
@property(nonatomic, strong) IBOutlet UIView *view5;
@property(nonatomic, strong) IBOutlet UIView *view6;
@property(nonatomic, strong) IBOutlet UIView *view7;
@property(nonatomic, strong) IBOutlet UIView *view8;
@property(nonatomic, strong) IBOutlet UIView *view9;
@property(nonatomic, strong) IBOutlet UIView *view10;

@property (nonatomic, strong) IBOutlet UIImageView *beautyView;
@end

@implementation UIViewTestController

- (void)loadView {
    [super loadView];

    self.view4.layer.masksToBounds = YES;
    self.view4.layer.cornerRadius = 50;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view1 jf_setCircleHollowWithMaskColor:[UIColor redColor] radius:30.0 center:CGPointMake(30, 30)];
    [self.view2 jf_setCenterCircleHollowWithMaskColor:[UIColor redColor] radius:30];
    [self.view3 jf_setHollowWithMaskColor:[UIColor redColor] rect:CGRectMake(10, 10, 30, 40)];
    [self.view4 jf_addCycleProgress:0.4 color:[UIColor blueColor] width:2.0];
    [self.view5 jf_addCircleLayerWithColor:[UIColor blueColor] width:3.0 radius:20];
    [self.view6 jf_addRectLayerWithColor:[UIColor greenColor] width:2.0 inRect:CGRectMake(20, 20, 30, 40)];

    [self.view7 jf_setTopLineWithImageName:@"cell-separator-top"];
    [self.view8 jf_setTopLineWithColor:[UIColor lightGrayColor]];
    [self.view9 jf_setBottomLineWithColor:[UIColor lightGrayColor]];
    [self.view10 jf_setBottomLineWithImageName:@"cell-separator-bottom"];

    // 高斯模糊（毛玻璃效果）
    [self.beautyView setJf_blurIntensity:0.5];
    [self.beautyView setJf_blurStyle:JFBlurEffectStyleDark];
    [self.beautyView setJf_blurTintColor:[UIColor redColor]];
    [self.beautyView jf_enableBlur:YES];

    NSLog(@"Blur or not: %d", self.beautyView.jf_isBlurred);
}

@end
