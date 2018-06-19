//
//  WLAnimationViewLineAudioEqualizer.m
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewLineAudioEqualizer.h"

@implementation LWAnimationViewLineAudioEqualizer
+ (void)setupAnimation:(CALayer *)layer size:(CGSize)size color:(UIColor *)color {
    CGFloat lineSize = size.width / 9;
    CGFloat x = (layer.bounds.size.width - lineSize * 7) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    NSArray *durations = @[@4.3,@2.5,@3.0,@5.0];
    NSArray *values = @[@0,@0.7,@0.4,@0.05,@0.95,@0.4,@0.15,@0.18,@0.5,@0.1];
    NSMutableArray *pathArr = @[].mutableCopy;
    for (int i = 0; i < 4; i++) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"path";
        animation.additive = YES;
        for (int j = 0; j < values.count; j++) {
            CGFloat heightFactor = [values[j] floatValue];
            CGFloat height = size.height * heightFactor;
            CGPoint point = CGPointMake(0, size.height - height);
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(point.x, point.y, lineSize, height)];
            [pathArr addObject:(id)path.CGPath];
        }
        animation.values = pathArr;
        animation.duration = [durations[i] doubleValue];
        animation.repeatCount = HUGE;
        animation.removedOnCompletion = NO;
        CALayer *lineLayer = [self customLineLayerWith:CGSizeMake(lineSize, size.height) color:color];
        CGRect frame = CGRectMake(x + lineSize * 2 * i, y, lineSize, size.height);
        lineLayer.frame = frame;
        [lineLayer addAnimation:animation forKey:@"animation"];
        [layer addSublayer:lineLayer];
    }
}
@end
