//
//  WLAnimationViewBallSpinFadeLoad.m
//  AnimationDemo
//
//  Created by weil on 2018/3/30.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallSpinFadeLoad.h"

@implementation LWAnimationViewBallSpinFadeLoad
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat circleSpacing = 2;
    CGFloat circleSize = (size.width - 2 * circleSpacing) / 5;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    CFTimeInterval duration = 1;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0, @0.12, @0.24, @0.36, @0.48, @0.6, @0.72, @0.84];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.keyTimes = @[@0,@0.5,@1];
    scaleAnimation.values = @[@1,@0.5,@1];
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.keyTimes = @[@0,@0.5,@1];
    opacityAnimation.values = @[@1,@0.3,@1];
    opacityAnimation.duration = duration;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,opacityAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    for (int i = 0; i < 8; i++) {
        CALayer *circleLayer = [self circleWithAngle:M_PI / 4 * i size:circleSize origin:CGPointMake(x, y) containerSize:size color:color];
        animationGroup.beginTime = beginTime + [beginTimes[i] doubleValue];
        [circleLayer addAnimation:animationGroup forKey:@"animation"];
        [layer addSublayer:circleLayer];
    }
}

+ (CALayer *)circleWithAngle:(CGFloat)angle size:(CGFloat)size origin:(CGPoint)origin containerSize:(CGSize)containerSize color:(UIColor *)color {
    CGFloat radius = containerSize.width / 2 - size / 2;
    CALayer *layer = [self customCircleLayerWith:CGSizeMake(size, size) color:color];
    layer.frame = CGRectMake(origin.x + radius * (cos(angle) + 1), origin.y + radius * (sin(angle)) + 1, size, size);
    return layer;
}
@end
