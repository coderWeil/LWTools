//
//  LWAnimationView.m
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationView.h"
#import "LWAnimationViewLineScale.h"
#import "LWAnimationViewLineScaleParty.h"
#import "LWAnimationViewLinePulseOut.h"
#import "LWAnimationViewLineAudioEqualizer.h"
#import "LWAnimationViewBallBeat.h"
#import "LWAnimationViewBallClipRotate.h"
#import "LWAnimationViewBallClipRotateMultiple.h"
#import "LWAnimationViewBallClipRotatePulse.h"
#import "LWAnimationViewBallGridBeat.h"
#import "LWAnimationViewBallGridPulse.h"
#import "LWAnimationViewBallPulse.h"
#import "LWAnimationViewBallPulseRise.h"
#import "LWAnimationViewBallPulseSyn.h"
#import "LWAnimationViewBallRotate.h"
#import "LWAnimationViewBallRotateChase.h"
#import "LWAnimationViewBallScale.h"
#import "LWAnimationViewBallSaleMultiple.h"
#import "LWAnimationViewBallScaleRipple.h"
#import "LWAnimationViewBallScaleRippleMultiple.h"
#import "LWAnimationViewBallSpinFadeLoad.h"

@interface LWAnimationView ()
@property (nonatomic,assign,readwrite) BOOL isAnimating;
@end
@implementation LWAnimationView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _padding = 0;
    }
    return self;
}
- (void)setupAnimation {
    CGRect animationRect = UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(_padding, _padding, _padding, _padding));
    CGFloat minEdge = MIN(animationRect.size.width, animationRect.size.height);
    self.layer.sublayers = nil;
    animationRect.size = CGSizeMake(minEdge, minEdge);
    switch (self.animationStyle) {
        case LWAnimationViewStyleLineScale:
            [LWAnimationViewLineScale setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleLineScaleParty:
            [LWAnimationViewLineScaleParty setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleLinePulseOut:
            [LWAnimationViewLinePulseOut setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleLineAudioEqualizer:
            [LWAnimationViewLineAudioEqualizer setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallBeat:
            [LWAnimationViewBallBeat setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallClipRotate:
            [LWAnimationViewBallClipRotate setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallClipRotateMultiple:
            [LWAnimationViewBallClipRotateMultiple setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallClipRotatePulse:
            [LWAnimationViewBallClipRotatePulse setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallGridBeat:
            [LWAnimationViewBallGridBeat setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallGridPulse:
            [LWAnimationViewBallGridPulse setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallPulse:
            [LWAnimationViewBallPulse setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationviewstyleBallPulseRise:
            [LWAnimationViewBallPulseRise setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallPulseSyn:
            [LWAnimationViewBallPulseSyn setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallRotate:
            [LWAnimationViewBallRotate setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallRotateChase:
            [LWAnimationViewBallRotateChase setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallScale:
            [LWAnimationViewBallScale setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallScaleMultiple:
            [LWAnimationViewBallSaleMultiple setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallScaleRipple:
            [LWAnimationViewBallScaleRipple setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallScaleRippleMultiple:
            [LWAnimationViewBallScaleRippleMultiple setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        case LWAnimationViewStyleBallSpinFadeLoad:
            [LWAnimationViewBallSpinFadeLoad setupAnimation:self.layer size:animationRect.size color:_color];
            break;
        default:
            break;
    }
}

- (void)startAnimation {
    self.hidden = NO;
    self.isAnimating = YES;
    self.layer.speed = 1;
    [self setupAnimation];
}

- (void)stopAnimation {
    self.hidden = YES;
    _isAnimating = NO;
    self.layer.sublayers = nil;
}

@end
