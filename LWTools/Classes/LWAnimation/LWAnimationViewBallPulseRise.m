//
//  WLAnimationViewBallPulseRise.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallPulseRise.h"

@implementation LWAnimationViewBallPulseRise
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSpacing = 2;
    CGFloat circleSize = (size.width - 4 * circleSpacing) / 5;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    CGFloat deltaY = size.height / 2;
    CFTimeInterval duration = 1;
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.15 :0.46 :0.9 :0.6];
    CAAnimation *oddAnimation = [self oddAnimation:duration deltaY:deltaY timingFunction:timingFunction];
    CAAnimation *evenAnimation = [self evenAnimation:duration deltaY:deltaY timingFunction:timingFunction];
    for (int i = 0; i < 5; i++) {
        CALayer *circleLayer = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
        circleLayer.frame = CGRectMake(x + circleSize * i + circleSpacing * i, y, circleSize, circleSize);
        if ( i % 2 == 0) {
            [circleLayer addAnimation:evenAnimation forKey:@"animation"];
        }else {
            [circleLayer addAnimation:oddAnimation forKey:@"animation"];
        }
        [layer addSublayer:circleLayer];
    }
}

+ (CAAnimation *)oddAnimation:(CFTimeInterval)duration deltaY:(CGFloat)deltaY timingFunction:(CAMediaTimingFunction *)timingFunction {
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.timingFunctions = @[timingFunction,timingFunction];
    scaleAnimation.values = @[@0.4,@1.1,@0.75];
    scaleAnimation.duration = duration;
    
    CAKeyframeAnimation *translateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    translateAnimation.keyTimes = @[@0,@0.25,@0.75,@1];
    translateAnimation.timingFunctions = @[timingFunction,timingFunction,timingFunction];
    translateAnimation.values = @[@0,@(deltaY),@(-deltaY),@0];
    translateAnimation.duration = duration;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,translateAnimation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    return animationGroup;
}

+ (CAAnimation *)evenAnimation:(CFTimeInterval)duration deltaY:(CGFloat)deltaY timingFunction:(CAMediaTimingFunction *)timingFunction {
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.timingFunctions = @[timingFunction,timingFunction];
    scaleAnimation.values = @[@1.1,@0.4,@1];
    scaleAnimation.duration = duration;
    
    CAKeyframeAnimation *translateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    translateAnimation.keyTimes = @[@0,@0.25,@0.75,@1];
    translateAnimation.timingFunctions = @[timingFunction,timingFunction,timingFunction];
    translateAnimation.values = @[@0,@(-deltaY),@(deltaY),@0];
    translateAnimation.duration = duration;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,translateAnimation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    return animationGroup;
}

@end
