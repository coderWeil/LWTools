//
//  WLAnimationViewBallClipRotate.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallClipRotate.h"

@implementation LWAnimationViewBallClipRotate
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CFTimeInterval duration = 0.75;
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.values = @[@1,@0.6,@1];
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.keyTimes = scaleAnimation.keyTimes;
    rotationAnimation.values = @[@0,@(M_PI),@(M_PI * 2)];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,rotationAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    CALayer *circleLayer = [self customThirdOfFourLayer:size color:color];
    circleLayer.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [circleLayer addAnimation:animationGroup forKey:@"animation"];
    [layer addSublayer:circleLayer];
}
@end
