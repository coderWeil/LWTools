//
//  WLAnimationViewBallScale.m
//  AnimationDemo
//
//  Created by weil on 2018/3/30.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewBallScale.h"

@implementation LWAnimationViewBallScale
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CFTimeInterval duration = 1;
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.fromValue = @0;
    scaleAnimation.toValue = @1;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = duration;
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation,opacityAnimation];
    animationGroup.duration = duration;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    
    CALayer *circleLayer = [self customCircleLayerWith:size color:color];
    circleLayer.frame = CGRectMake((layer.bounds.size.width - size.width)/ 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [circleLayer addAnimation:animationGroup forKey:@"animation"];
    [layer addSublayer:circleLayer];
}
@end
