//
//  WLAnimationViewBallRotateChase.m
//  AnimationDemo
//
//  Created by weil on 2018/3/30.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallRotateChase.h"

@implementation LWAnimationViewBallRotateChase
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSize = size.width / 10;
    for (int i = 0; i < 10; i++) {
        CGFloat factor = (CGFloat)i / (CGFloat)10;
        CALayer *circleLayer = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
        CAAnimation *animation = [self createRotateAnimation:factor x:layer.bounds.size.width / 2 y:layer.bounds.size.height / 2 size:CGSizeMake(size.width - circleSize, size.height - circleSize)];
        circleLayer.frame = CGRectMake(0, 0, circleSize, circleSize);
        [circleLayer addAnimation:animation forKey:@"animation"];
        [layer addSublayer:circleLayer];
    }
}

+ (CAAnimation *)createRotateAnimation:(CGFloat)rate x:(CGFloat)x y:(CGFloat)y size:(CGSize)size {
    CFTimeInterval duration = 1.5;
    CGFloat fromScale = 1- rate;
    CGFloat toScale = 0.2 + rate;
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5 :0.15 + rate :0.25 :1];
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.repeatCount = HUGE;
    scaleAnimation.fromValue = @(fromScale);
    scaleAnimation.toValue = @(toScale);
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = duration;
    positionAnimation.repeatCount = HUGE;
    positionAnimation.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x, y) radius:size.width / 2 startAngle:(3 * M_PI *0.5) endAngle:(3* M_PI *0.5 + 2 * M_PI) clockwise:YES].CGPath;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,positionAnimation];
    animationGroup.timingFunction = timingFunction;
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    return animationGroup;
}

@end
