//
//  LWAnimationStyleBase.m
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationStyleBase.h"

@implementation LWAnimationStyleBase
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color{}

+ (CALayer *)customLineLayerWith:(CGSize)size color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = nil;
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:size.width / 2];
    layer.fillColor = color.CGColor;
    layer.backgroundColor = nil;
    layer.path = path.CGPath;
    return layer;
}

+ (CALayer *)customCircleLayerWith:(CGSize)size color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:0 endAngle:2 * M_PI clockwise:NO];
    layer.fillColor = color.CGColor;
    layer.backgroundColor = nil;
    layer.path = path.CGPath;
    return layer;
}

+ (CALayer *)customThirdOfFourLayer:(CGSize)size color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:(- 3 *M_PI / 4) endAngle:- M_PI / 4 clockwise:NO];
    layer.fillColor = nil;
    layer.path = path.CGPath;
    layer.strokeColor = color.CGColor;
    layer.lineWidth = 2;
    layer.backgroundColor = nil;
    return layer;
}

+ (CALayer *)customRingTwoHalfVertical:(CGSize)size color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:- 3* M_PI / 4 endAngle:-M_PI / 4 clockwise:YES];
    [path moveToPoint:CGPointMake(size.width / 2 - size.width / 2 * cos(M_PI / 4), size.height / 2 + size.height / 2 * sin(M_PI / 4))];
    [path addArcWithCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:-5 * M_PI / 4 endAngle:- 7 * M_PI / 4 clockwise:NO];
    layer.fillColor = nil;
    layer.strokeColor = color.CGColor;
    layer.lineWidth = 2;
    layer.backgroundColor = nil;
    layer.path = path.CGPath;
    return layer;
}
+ (CALayer *)customRingTwoHalfHorizontal:(CGSize)size color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:3 * M_PI / 4 endAngle:5 * M_PI / 4 clockwise:YES];
    [path moveToPoint:CGPointMake(size.width / 2 + size.width / 2 * cos(M_PI / 4), size.height / 2 - size.height / 2 * sin(M_PI / 4))];
    [path addArcWithCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:-M_PI / 4 endAngle:M_PI / 4 clockwise:YES];
    layer.fillColor = nil;
    layer.strokeColor = color.CGColor;
    layer.lineWidth = 2;
    layer.backgroundColor = nil;
    layer.path = path.CGPath;
    return layer;
}

@end
