//
//  WLAnimationViewBallPulseSyn.m
//  AnimationDemo
//
//  Created by weil on 2018/3/29.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallPulseSyn.h"

@implementation LWAnimationViewBallPulseSyn
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSpacing = 2;
    CGFloat circleSize = (size.width - 2 * circleSpacing) / 3;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.width - circleSize) / 2;
    CGFloat deltaY = (size.height / 2 - circleSize/2) / 2;
    CFTimeInterval duration = 0.6;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0.07,@0.14,@0.21];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.keyTimes = @[@0,@0.33,@0.66,@1];
    animation.timingFunctions = @[timingFunction,timingFunction,timingFunction];
    animation.duration = duration;
    animation.values = @[@0,@(deltaY),@(-deltaY),@0];
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
