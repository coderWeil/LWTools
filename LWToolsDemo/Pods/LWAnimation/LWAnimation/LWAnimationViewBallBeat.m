//
//  WLAnimationViewBallBeat.m
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallBeat.h"

@implementation LWAnimationViewBallBeat
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSpacing = 2;
    CGFloat circleSize = (size.width - circleSpacing * 2) / 3;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - circleSize) / 2;
    CFTimeInterval duration = 0.7;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0.35,@0,@0.35];
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transfor.scale"];
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.values = @[@1,@0.75,@1];
    scaleAnimation.duration = duration;
    CAKeyframeAnimation *opaueAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opaueAnimation.keyTimes = @[@0,@0.5,@1];
    opaueAnimation.values = @[@1,@0.2,@1];
    opaueAnimation.duration = duration;
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,opaueAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    for (int i = 0; i < 3; i++) {
        CALayer *circle = [self customCircleLayerWith:CGSizeMake(circleSize, circleSize) color:color];
        CGRect frame = CGRectMake(x+circleSize * i + circleSpacing * i, y, circleSize, circleSize);
        animationGroup.beginTime = beginTime + [beginTimes[i] doubleValue];
        circle.frame = frame;
        [circle addAnimation:animationGroup forKey:@"animation"];
        [layer addSublayer:circle];
    }
}
@end
