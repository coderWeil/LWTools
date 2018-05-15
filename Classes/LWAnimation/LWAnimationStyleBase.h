//
//  LWAnimationStyleBase.h
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LWAnimationStyleBase : NSObject
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color;
//线性
+ (CALayer *)customLineLayerWith:(CGSize)size color:(UIColor *)color;
//圆形
+ (CALayer *)customCircleLayerWith:(CGSize)size color:(UIColor *)color;

+ (CALayer *)customThirdOfFourLayer:(CGSize)size color:(UIColor *)color;

+ (CALayer *)customRingTwoHalfVertical:(CGSize)size color:(UIColor *)color;

+ (CALayer *)customRingTwoHalfHorizontal:(CGSize)size color:(UIColor *)color;

@end
