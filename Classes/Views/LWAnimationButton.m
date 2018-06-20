//
//  LWAnimationButton.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationButton.h"
#import "LWEmitterView.h"

@interface LWAnimationButton ()
@property (nonatomic,strong) LWEmitterView *fireAnimationView;
@end

@implementation LWAnimationButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setParticleImage:(UIImage *)particleImage {
    self.fireAnimationView.particleImage = particleImage;
}
- (void)setParticleScale:(CGFloat)particleScale {
    self.fireAnimationView.particleScale = particleScale;
}
- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    self.fireAnimationView.particleScaleRange = particleScaleRange;
}
- (CGFloat)particleScaleRange {
    return self.fireAnimationView.particleScaleRange;
}
-(CGFloat)particleScale {
    return self.fireAnimationView.particleScale;
}
- (UIImage *)particleImage {
    return self.fireAnimationView.particleImage;
}
- (void)setup {
    self.fireAnimationView = [[LWEmitterView alloc] init];
    [self insertSubview:self.fireAnimationView atIndex:0];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.fireAnimationView.frame = self.bounds;
}

- (void)startAnimation {
    [self.fireAnimationView startFireAnimation];
}
//弹出
- (void)popOutSideWithDuration:(NSTimeInterval)duration {
    
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
            self.imageView.transform = CGAffineTransformMakeScale(2.0f, 2.0f); // 放大
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
            self.imageView.transform = CGAffineTransformMakeScale(0.8f, 0.8f); // 放小
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
            self.imageView.transform = CGAffineTransformMakeScale(1.0f, 1.0f); //恢复原样
        }];
    } completion:nil];
}
//弹进
- (void)popInSideWithDuration:(NSTimeInterval)duration {
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 2.0 animations: ^{
            self.imageView.transform = CGAffineTransformMakeScale(0.7f, 0.7f); // 放小
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations: ^{
            self.imageView.transform = CGAffineTransformMakeScale(1.0f, 1.0f); //恢复原样
        }];
    } completion:nil];
}


@end
