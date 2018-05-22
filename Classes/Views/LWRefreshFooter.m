//
//  LWRereshFooter.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/22.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWRefreshFooter.h"

@interface LWRefreshFooter ()
@property (nonatomic,strong) CAShapeLayer *shapeLayer;
@property (nonatomic,strong) LWAnimationView *animationView;
@end

@implementation LWRefreshFooter
- (LWAnimationView *)animationView {
    if (!_animationView) {
        _animationView = [[LWAnimationView alloc] init];
        _animationView.backgroundColor = [UIColor clearColor];
        _animationView.alpha = 0.0;
        _animationView.padding = 5.0;
        [self addSubview:_animationView];
    }
    return _animationView;
}

#pragma mark - 公共方法
- (void)setLoadingColor:(UIColor *)loadingColor {
    _loadingColor = loadingColor;
    self.animationView.color = loadingColor;
}
- (void)setStyle:(LWAnimationViewStyle)style {
    _style = style;
    self.animationView.animationStyle = style;
}

- (void)prepare {
    
    [super prepare];
    if (!self.tintColor) {
        self.tintColor = [UIColor orangeColor];
    }
}

- (void)placeSubviews {
    
    [super placeSubviews];
    self.animationView.bounds = CGRectMake(0, 0, _loadingSize, _loadingSize);
    self.animationView.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
    [self.animationView startAnimation];
}

- (void)setState:(MJRefreshState)state {
    
    [super setState:state];
    if (state == MJRefreshStateIdle) {
        //刷新完成
        [self.animationView stopAnimation];
    }else if (state == MJRefreshStatePulling) {
    }else if (state == MJRefreshStateRefreshing) {
        //正在刷新
        [self.animationView startAnimation];
    }
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    
    [super scrollViewContentOffsetDidChange:change];
    self.animationView.alpha = self.pullingPercent;
}

@end
