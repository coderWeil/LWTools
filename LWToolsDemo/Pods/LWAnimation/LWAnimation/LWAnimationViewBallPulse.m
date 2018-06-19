//
//  WLAnimationViewBallPulse.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallPulse.h"

@implementation LWAnimationViewBallPulse
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSpacing = 2;
    CGFloat circleSize = (size.width - 2 * circleSpacing) / 3;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    CFTimeInterval duration = 0.75;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0.12,@0.24,@0.36];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2 :0.68 :0.18 :1.08];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.keyTimes = @[@0,@0.3,@1];
    animation.timingFunctions = @[timingFunction,timingFunction];
    animation.values = @[@1,@0.3,@1];
    animation.duration = duration;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    for (int i = 0; i < 3; i++) {
        CALayer *circleLayer = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
        circleLayer.frame = CGRectMake(x + circleSize * i + circleSpacing * i, y, circleSize, circleSize);
        animation.beginTime = beginTime + [beginTimes[i] doubleValue];
        [circleLayer addAnimation:animation forKey:@"animation"];
        [layer addSublayer:circleLayer];
    }
}
@end
