//
//  WLAnimationViewBallClipRotatePulse.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallClipRotatePulse.h"

@implementation LWAnimationViewBallClipRotatePulse
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CFTimeInterval duration = 1;
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.09 :0.57 :0.49 :0.9];
    [self smallCircle:duration timingFunction:timingFunction layer:layer size:size color:color];
    [self bigCircle:duration timingFunction:timingFunction layer:layer size:size color:color];
}
+ (void)smallCircle:(CFTimeInterval)duration timingFunction:(CAMediaTimingFunction *)timingFunction layer:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.keyTimes = @[@0,@0.3,@1];
    animation.timingFunctions = @[timingFunction,timingFunction];
    animation.values = @[@1,@0.3,@1];
    animation.duration = duration;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    CGFloat circleSize = size.width / 2;
    CALayer *circleLayer = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
    circleLayer.frame = CGRectMake((layer.bounds.size.width - circleSize) / 2, (layer.bounds.size.height - circleSize) / 2, circleSize, circleSize);
    [circleLayer addAnimation:animation forKey:@"animation"];
    [layer addSublayer:circleLayer];
}
+ (void)bigCircle:(CFTimeInterval)duration timingFunction:(CAMediaTimingFunction *)timingFunction layer:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.timingFunctions = @[timingFunction,timingFunction];
    scaleAnimation.values = @[@1,@0.6,@1];
    scaleAnimation.duration = duration;
    
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.keyTimes = scaleAnimation.keyTimes;
    rotationAnimation.timingFunctions = @[timingFunction,timingFunction];
    rotationAnimation.values = @[@0,@(M_PI),@(M_PI * 2)];
    rotationAnimation.duration = duration;
    
    CAAnimationGroup *animtionGroup = [CAAnimationGroup animation];
    animtionGroup.animations = @[scaleAnimation,rotationAnimation];
    animtionGroup.duration = duration;
    animtionGroup.repeatCount = HUGE;
    animtionGroup.removedOnCompletion = NO;
    
    CALayer *circleLayer = [self customRingTwoHalfVertical:size color:color];
    circleLayer.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [circleLayer addAnimation:animtionGroup forKey:@"animation"];
    [layer addSublayer:circleLayer];
}
@end
