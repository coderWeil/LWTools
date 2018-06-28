//
//  WLAnimationViewBallGridBeat.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallGridBeat.h"

@implementation LWAnimationViewBallGridBeat
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSpacing = 2.0;
    CGFloat circleSize = (size.width - circleSpacing * 2) / 3;
    CGFloat x = (layer.bounds.size.width - size.width)  /2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    NSArray *durations = @[@0.96, @0.93, @1.19, @1.13, @1.34, @0.94, @1.2, @0.82, @1.19];
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0.36, @0.4, @0.68, @0.41, @0.71, @(-0.15), @(-0.12), @0.01, @0.32];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    animation.keyTimes = @[@0,@0.5,@1];
    animation.timingFunctions = @[timingFunction,timingFunction];
    animation.values = @[@1,@0.7,@1];
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            CALayer *circleLayer = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
            circleLayer.frame = CGRectMake(x + circleSize * j+ circleSpacing * j, y + circleSize * i + circleSpacing * i, circleSize, circleSize);
            animation.duration = [durations[3 * i + j] doubleValue];
            animation.beginTime = beginTime + [beginTimes[3 * i + j] doubleValue];
            [circleLayer addAnimation:animation forKey:@"animation"];
            [layer addSublayer:circleLayer];
        }
    }
}
@end
