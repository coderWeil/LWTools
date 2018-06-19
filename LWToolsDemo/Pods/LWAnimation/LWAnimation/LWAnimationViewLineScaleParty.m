//
//  WLAnimationViewLineScaleParty.m
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewLineScaleParty.h"

@implementation LWAnimationViewLineScaleParty
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat lineSize = size.width / 7;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    NSArray *durations = @[@1.26,@0.43,@1.01,@0.73];
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray *beginTimes = @[@0.77,@0.29,@0.28,@0.74];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.keyTimes = @[@0,@0.5,@1];
    animation.timingFunctions = @[timingFunction,timingFunction];
    animation.values = @[@1,@0.5,@1];
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    for (int i = 0; i < 4; i++) {
        CALayer *lineLayer = [self customLineLayerWith:CGSizeMake(lineSize, size.height) color:color];
        CGRect frame = CGRectMake(x + lineSize * 2 * i, y, lineSize, size.height);
        animation.beginTime = beginTime + [beginTimes[i] doubleValue];
        animation.duration = [durations[i] doubleValue];
        lineLayer.frame = frame;
        [lineLayer addAnimation:animation forKey:@"animation"];
        [layer addSublayer:lineLayer];
    }

}
@end
