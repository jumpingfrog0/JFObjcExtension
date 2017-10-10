//
//  UIViewTestController.m
//  ObjcExtension
//
//  Created by sheldon on 29/09/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "UIViewTestController.h"
#import "UIView+Extend.h"
#import "UIView+Drawing.h"

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

    [self.view1 setCircleHollowWithMaskColor:[UIColor redColor] radius:30.0 center:CGPointMake(30, 30)];
    [self.view2 setCenterCircleHollowWithMaskColor:[UIColor redColor] radius:30];
    [self.view3 setHollowWithMaskColor:[UIColor redColor] rect:CGRectMake(10, 10, 30, 40)];
    [self.view4 addCycleProgress:0.4 color:[UIColor blueColor] width:2.0];
    [self.view5 addCircleLayerWithColor:[UIColor blueColor] width:3.0 radius:20];
    [self.view6 addRectLayerWithColor:[UIColor greenColor] width:2.0 inRect:CGRectMake(20, 20, 30, 40)];

    [self.view7 setTopLineWithImageName:@"cell-separator-top"];
    [self.view8 setTopLineWithColor:[UIColor lightGrayColor]];
    [self.view9 setBottomLineWithColor:[UIColor lightGrayColor]];
    [self.view10 setBottomLineWithImageName:@"cell-separator-bottom"];

    // 高斯模糊（毛玻璃效果）
    [self.beautyView setBlurIntensity:0.5];
    [self.beautyView setBlurStyle:JFBlurEffectStyleDark];
    [self.beautyView setBlurTintColor:[UIColor redColor]];
    [self.beautyView enableBlur:YES];

    NSLog(@"Blur or not: %d", self.beautyView.isBlurred);
}

@end
