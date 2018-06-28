//
//  LWEmitterView.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWEmitterView.h"

@interface LWEmitterView ()
@property (nonatomic,strong) CAEmitterLayer *emitterLayer;
@property (nonatomic,strong) CAEmitterCell *emitterCell;
@end

@implementation LWEmitterView

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
    _particleImage = particleImage;
    self.emitterCell.contents = (id)[particleImage CGImage];
}
- (void)setParticleScale:(CGFloat)particleScale {
    _particleScale = particleScale;
    self.emitterCell.scale = particleScale;
}
- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    _particleScaleRange = particleScaleRange;
    self.emitterCell.scaleRange = particleScaleRange;
}

- (void)setup {
    self.clipsToBounds = NO;
    self.userInteractionEnabled = NO;
    self.emitterCell = [CAEmitterCell emitterCell];
    self.emitterCell.name = @"explosion";
    self.emitterCell.alphaRange = 0.2f;
    self.emitterCell.alphaSpeed = -1.0f;
    self.emitterCell.lifetime = 0.7f;
    self.emitterCell.lifetimeRange = 0.3f;
    self.emitterCell.birthRate = 0.f;
    self.emitterCell.velocity = 40.0f;
    self.emitterCell.velocityRange = 10.0f;
    
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.name = @"emitterLayer";
    self.emitterLayer.emitterShape = kCAEmitterLayerCircle;
    self.emitterLayer.emitterMode = kCAEmitterLayerOutline;
    self.emitterLayer.emitterSize = CGSizeMake(25.0f, 0.0f);
    self.emitterLayer.emitterCells = @[self.emitterCell];
    self.emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    self.emitterLayer.masksToBounds = NO;
    [self.layer addSublayer:self.emitterLayer];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.emitterLayer.emitterPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
}
/** 开启粒子动画 **/
- (void)startFireAnimation {
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        self.emitterLayer.beginTime = CACurrentMediaTime();
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"emitterCells.explosion.birthRate"];
        animation.fromValue = @0;
        animation.toValue = @1000;
        [self.emitterLayer addAnimation:animation forKey:@"emitterFire"];
    });
}
@end
