//
//  LWAnimationView.h
//  AnimationDemo
//
//  Created by weil on 2018/3/28.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,LWAnimationViewStyle) {
    LWAnimationViewStyleLineScale,
    LWAnimationViewStyleLineScaleParty,
    LWAnimationViewStyleLinePulseOut,
    LWAnimationViewStyleLineAudioEqualizer,
    LWAnimationViewStyleBallBeat,
    LWAnimationViewStyleBallClipRotate,
    LWAnimationViewStyleBallClipRotateMultiple,
    LWAnimationViewStyleBallClipRotatePulse,
    LWAnimationViewStyleBallGridBeat,
    LWAnimationViewStyleBallGridPulse,
    LWAnimationViewStyleBallPulse,
    LWAnimationviewstyleBallPulseRise,
    LWAnimationViewStyleBallPulseSyn,
    LWAnimationViewStyleBallRotate,
    LWAnimationViewStyleBallRotateChase,
    LWAnimationViewStyleBallScale,
    LWAnimationViewStyleBallScaleMultiple,
    LWAnimationViewStyleBallScaleRipple,
    LWAnimationViewStyleBallScaleRippleMultiple,
    LWAnimationViewStyleBallSpinFadeLoad
};

@interface LWAnimationView : UIView
@property (nonatomic,assign) CGFloat padding;
@property (nonatomic,strong) UIColor *color;
@property (nonatomic,assign,readonly) BOOL isAnimating;
@property (nonatomic,assign) LWAnimationViewStyle animationStyle;
- (void)startAnimation;
- (void)stopAnimation;
@end
