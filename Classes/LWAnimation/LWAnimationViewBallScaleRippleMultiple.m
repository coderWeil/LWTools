//
//  WLAnimationViewBallScaleRippleMultiple.m
//  AnimationDemo
//
//  Created by weil on 2018/3/30.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallScaleRippleMultiple.h"

@implementation LWAnimationViewBallScaleRippleMultiple
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CFTimeInterval duration = 1.25;
    CFTimeInterval begimTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0,@0.2,@0.4];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.21 :0.53 :0.56 :0.8];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.keyTimes = @[@0,@0.7];
    scaleAnimation.values = @[@0,@1];
    scaleAnimation.timingFunction = timingFunction;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = duration;
    opacityAnimation.keyTimes = @[@0,@0.7,@1];
    opacityAnimation.values = @[@1,@0.7,@0];
    opacityAnimation.timingFunctions = @[timingFunction,timingFunction];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,opacityAnimation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;

    for (int i = 0; i < 3; i++) {
        CALayer *circleLayer = [self customCircleLayerWith:size color:color];
        circleLayer.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
        animationGroup.beginTime = begimTime + [beginTimes[i] doubleValue];
        [circleLayer addAnimation:animationGroup forKey:@"animation"];
        [layer addSublayer:circleLayer];
    }
}
@end
