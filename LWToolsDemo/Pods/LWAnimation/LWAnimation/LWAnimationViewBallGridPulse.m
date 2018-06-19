//
//  WLAnimationViewBallGridPulse.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallGridPulse.h"

@implementation LWAnimationViewBallGridPulse
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSpacing = 2;
    CGFloat circleSize = (size.width - circleSpacing * 2) / 3;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    NSArray *durations = @[@0.72, @1.02, @1.28, @1.42, @1.45, @1.18, @0.87, @1.45, @1.06];
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@(-0.06), @0.25, @(-0.17), @0.48, @0.31, @0.03, @0.46, @0.78, @0.45];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.timingFunctions = @[timingFunction,timingFunction];
    scaleAnimation.values = @[@1,@0.5,@1];
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.keyTimes = scaleAnimation.keyTimes;
    opacityAnimation.timingFunctions = scaleAnimation.timingFunctions;
    opacityAnimation.values = @[@1,@0.7,@1];
    
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[scaleAnimation,opacityAnimation];
    animations.repeatCount = HUGE;
    animations.removedOnCompletion = NO;
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            CALayer *circleLayer = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
            circleLayer.frame = CGRectMake(x + circleSize * j+ circleSpacing * j, y + circleSize * i + circleSpacing * i, circleSize, circleSize);
            animations.duration = [durations[3 * i + j] doubleValue];
            animations.beginTime = beginTime + [beginTimes[3 * i + j] doubleValue];
            [circleLayer addAnimation:animations forKey:@"animation"];
            [layer addSublayer:circleLayer];
        }
    }
}
@end
