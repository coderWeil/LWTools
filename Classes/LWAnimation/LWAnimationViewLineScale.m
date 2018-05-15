//
//  WLAnimationViewLineScale.m
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewLineScale.h"

@implementation LWAnimationViewLineScale
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat lineSize = size.width / 9;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    CFTimeInterval duration = 1;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0.1,@0.2,@0.3,@0.4,@0.5];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2 :0.68 :0.18 :1.08];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.keyTimes = @[@0,@0.5,@1];
    animation.timingFunctions = @[timingFunction,timingFunction];
    animation.values = @[@1,@0.4,@1];
    animation.duration = duration;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    for (int i = 0; i < 5; i++) {
        CALayer *lineLayer = [self customLineLayerWith:CGSizeMake(lineSize, size.height) color:color];
        CGRect frame = CGRectMake(x + lineSize * 2 * i, y, lineSize, size.height);
        animation.beginTime = beginTime + [beginTimes[i] doubleValue];
        lineLayer.frame = frame;
        [lineLayer addAnimation:animation forKey:@"animation"];
        [layer addSublayer:lineLayer];
    }
}


@end
