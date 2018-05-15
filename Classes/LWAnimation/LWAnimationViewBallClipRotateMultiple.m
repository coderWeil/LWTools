//
//  WLAnimationViewBallClipRotateMultiple.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallClipRotateMultiple.h"

@implementation LWAnimationViewBallClipRotateMultiple
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat bigCircleSize = size.width;
    CGFloat smallCircleSize = size.width / 2;
    CFTimeInterval longDuration = 1;
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self addRingTwoOfHorziontalAnimation:longDuration timingFunction:timingFunction layer:layer szie:bigCircleSize color:color reverse:NO];
    [self addRingTwoOfVerticalAnimation:longDuration timingFunction:timingFunction layer:layer szie:smallCircleSize color:color reverse:YES];
}
+ (void)addRingTwoOfVerticalAnimation:(CFTimeInterval)duration timingFunction:(CAMediaTimingFunction *)timingFunction layer:(CALayer *)layer szie:(CGFloat)size color:(UIColor *)color reverse:(BOOL)reverse {
    CALayer *circleLayer = [self customRingTwoHalfVertical:CGSizeMake(size, size) color:color];
    circleLayer.frame = CGRectMake((layer.bounds.size.width - size) / 2, (layer.bounds.size.height - size) / 2, size, size);
    CAAnimation *animation = [self createAnimation:duration timngFunction:timingFunction reverse:reverse];
    [circleLayer addAnimation:animation forKey:@"animation"];
    [layer addSublayer:circleLayer];
}
+ (void)addRingTwoOfHorziontalAnimation:(CFTimeInterval)duration timingFunction:(CAMediaTimingFunction *)timingFunction layer:(CALayer *)layer szie:(CGFloat)size color:(UIColor *)color reverse:(BOOL)reverse {
    CALayer *circleLayer = [self customRingTwoHalfHorizontal:CGSizeMake(size, size) color:color];
    circleLayer.frame = CGRectMake((layer.bounds.size.width - size) / 2, (layer.bounds.size.height - size) / 2, size, size);
    CAAnimation *animation = [self createAnimation:duration timngFunction:timingFunction reverse:reverse];
    [circleLayer addAnimation:animation forKey:@"animation"];
    [layer addSublayer:circleLayer];
}

+ (CAAnimation *)createAnimation:(CFTimeInterval)duration timngFunction:(CAMediaTimingFunction *) timingFunction reverse:(BOOL)reverse {
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.timingFunctions = @[timingFunction,timingFunction];
    scaleAnimation.values = @[@1,@0.6,@1];
    scaleAnimation.duration = duration;
    
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.keyTimes = scaleAnimation.keyTimes;
    rotationAnimation.timingFunctions = @[timingFunction,timingFunction];
    if (!reverse) {
        rotationAnimation.values = @[@0,@(M_PI),@(M_PI * 2)];
    }else {
        rotationAnimation.values = @[@0,@(-M_PI),@(-M_PI * 2)];
    }
    rotationAnimation.duration = duration;
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,rotationAnimation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    return animationGroup;
}
@end
