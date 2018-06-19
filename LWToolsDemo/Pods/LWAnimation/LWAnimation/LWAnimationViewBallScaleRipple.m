//
//  WLAnimationViewBallScaleRipple.m
//  AnimationDemo
//
//  Created by weil on 2018/3/30.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallScaleRipple.h"

@implementation LWAnimationViewBallScaleRipple
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CFTimeInterval duration = 1.0;
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.21 :0.53 :0.56 :0.8];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.keyTimes = @[@0,@0.7];
    scaleAnimation.timingFunction = timingFunction;
    scaleAnimation.values = @[@0,@0.7,@1];
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = duration;
    opacityAnimation.keyTimes = @[@0,@0.7,@1];
    opacityAnimation.timingFunctions = @[timingFunction,timingFunction];
    opacityAnimation.values = @[@1,@0.7,@0];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,opacityAnimation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    
    CALayer *circleLayer = [self customCircleLayerWith:size color:color];
    circleLayer.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [circleLayer addAnimation:animationGroup forKey:@"animation"];
    [layer addSublayer:circleLayer];
}
@end
