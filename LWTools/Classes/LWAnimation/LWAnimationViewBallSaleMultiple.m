//
//  WLAnimationViewBallSaleMultiple.m
//  AnimationDemo
//
//  Created by weil on 2018/3/30.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallSaleMultiple.h"

@implementation LWAnimationViewBallSaleMultiple
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CFTimeInterval duration = 1.5;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0,@0.2,@0.4];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.fromValue = @0;
    scaleAnimation.toValue = @1;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = duration;
    opacityAnimation.keyTimes = @[@0,@0.05,@1];
    opacityAnimation.values = @[@0,@1,@0];
    
    CAAnimationGroup *animationGroup =[CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,opacityAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    
    for (int i = 0; i < 3; i++) {
        CALayer *circleLayer = [self customCircleLayerWith:size color:color];
        circleLayer.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
        animationGroup.beginTime = beginTime + [beginTimes[i] doubleValue];
        circleLayer.opacity = 0;
        [circleLayer addAnimation:animationGroup forKey:@"animation"];
        [layer addSublayer:circleLayer];
    }
}
@end
