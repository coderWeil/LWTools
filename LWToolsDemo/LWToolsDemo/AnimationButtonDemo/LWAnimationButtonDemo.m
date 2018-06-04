//
//  LWAnimationButtonDemo.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/9.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationButtonDemo.h"
#import "LWAnimationButton.h"
#import "UIView+LWFrame.h"

@interface LWAnimationButtonDemo ()
@property (nonatomic,strong) LWAnimationButton *animationButton;
@end

@implementation LWAnimationButtonDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _animationButton = [LWAnimationButton buttonWithType:UIButtonTypeCustom];
    _animationButton.titleLabel.font = [UIFont systemFontOfSize:12];
    _animationButton.particleImage = [UIImage imageNamed:@"detail_zan_selected"];
    _animationButton.particleScale = 0.05;
    _animationButton.particleScaleRange = 0.02f;
    [_animationButton setImage:[UIImage imageNamed:@"detail_zan"] forState:UIControlStateNormal];
    [_animationButton setImage:[UIImage imageNamed:@"detail_zan_selected"] forState:UIControlStateSelected];
    [_animationButton addTarget:self action:@selector(zanAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_animationButton];
    _animationButton.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.5);
    _animationButton.bounds = CGRectMake(0, 0, 50, 20);
}

- (void)zanAction {
    if (_animationButton.selected) {
        [_animationButton popInSideWithDuration:0.5];
    }else {
        [_animationButton popOutSideWithDuration:0.5];
        [_animationButton startAnimation];
    }
    _animationButton.selected = !_animationButton.selected;
}


@end
