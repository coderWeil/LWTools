//
//  LWViewImageController.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/9.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWViewImageController.h"
#import "LWAnimationButton.h"
#import "UIView+LWFrame.h"

@interface LWViewImageController ()
@property (nonatomic,strong) LWAnimationButton *animationButton;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation LWViewImageController

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
    _animationButton.center = CGPointMake(self.view.lw_width * 0.5, self.view.lw_height * 0.5);
    _animationButton.bounds = CGRectMake(0, 0, 50, 20);
    
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(50, 100, 50, 20);
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_imageView];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    _imageView.image = [_animationButton getImageFromView];
}

@end
