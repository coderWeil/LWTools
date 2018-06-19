//
//  WLAnimationViewBallRotate.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallRotate.h"

@implementation LWAnimationViewBallRotate
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSize = size.width / 5;
    CFTimeInterval duration = 1.0;
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.7 :-0.13 :0.22 :0.86];
    CAKeyframeAnimation *scaleAnimaiton = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimaiton.keyTimes = @[@0,@0.5,@1];
    scaleAnimaiton.timingFunctions = @[timingFunction,timingFunction];
    scaleAnimaiton.values = @[@1,@0.6,@1];
    scaleAnimaiton.duration = duration;
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.keyTimes = @[@0,@0.5,@1];
    rotateAnimation.timingFunctions = @[timingFunction,timingFunction];
    rotateAnimation.values = @[@0,@(M_PI),@(M_PI * 2)];
    rotateAnimation.duration = duration;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimaiton,rotateAnimation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;

    CALayer *leftCircle = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
    CALayer *rightCircle = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
    CALayer *centerCircle = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
    
    leftCircle.opacity = 0.8;
    leftCircle.frame = CGRectMake(0, (size.height - circleSize) / 2, circleSize, circleSize);
    
    rightCircle.opacity = 0.8;
    rightCircle.frame = CGRectMake(size.width - circleSize, (size.height - circleSize) / 2, circleSize, circleSize);
    
    centerCircle.frame = CGRectMake((size.width - circleSize) / 2, (size.height - circleSize) / 2, circleSize, circleSize);
    
    CALayer *circle = [CALayer layer];
    circle.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [circle addSublayer:leftCircle];
    [circle addSublayer:rightCircle];
    [circle addSublayer:centerCircle];
    [circle addAnimation:animationGroup forKey:@"animation"];
    [layer addSublayer:circle];
}
@end
