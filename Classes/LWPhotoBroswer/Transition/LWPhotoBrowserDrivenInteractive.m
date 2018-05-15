//
//  LWPhotoBrowserDrivenInteractive.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoBrowserDrivenInteractive.h"
#import "LWPhotoBrowserTransition.h"

@interface LWPhotoBrowserDrivenInteractive()
@property (nonatomic,strong) LWPhotoBrowserTransition *photoBrowserTransition;
@property (nonatomic,weak) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic,strong) UIView *blackBgView;
@property (nonatomic,strong) UIView *fromView;
@property (nonatomic,strong) UIView *whiteBgView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong,readonly) UIPanGestureRecognizer *panGestureRecognizer;
@end

@implementation LWPhotoBrowserDrivenInteractive
- (void)dealloc {
    [self.panGestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
}
- (instancetype)initWithTransition:(LWPhotoBrowserTransition *)transition {
    self = [super init];
    if (self) {
        _photoBrowserTransition = transition;
        _panGestureRecognizer = transition.panGestureRecognizer;
        [_panGestureRecognizer addTarget:self action:@selector(gestureRecognizeDidUpdate:)];
    }
    return self;
}
- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:gesture.view];
    CGFloat scale = 1- (translation.y / LW_SCREENHEIGHT);
    scale = scale < 0 ? 0 : scale;
    scale = scale > 1 ? 1 : scale;
    return scale;
}
- (void)gestureRecognizeDidUpdate:(UIPanGestureRecognizer *)gestureRecognizer {
    CGFloat scale = [self percentForGesture:gestureRecognizer];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
            [self updateInteractiveTransition:scale];
            [self updateInterPercent:scale];
            break;
        case UIGestureRecognizerStateEnded:
            if (scale > 0.95f) {
                [self cancelInteractiveTransition];
                [self interPercentCancel];
            }else {
                [self finishInteractiveTransition];
                [self interPercentFinish:scale];
            }
            break;
            
        default:
            [self cancelInteractiveTransition];
            [self interPercentCancel];
            break;
    }
}
- (void)updateInterPercent:(CGFloat)scale {
    _blackBgView.alpha = scale * scale * scale;
}
- (void)interPercentCancel {
    id<UIViewControllerContextTransitioning> transitionContext = _transitionContext;
    UIView *container = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    fromView.backgroundColor = [UIColor blackColor];
    [container addSubview:fromView];
    [_blackBgView removeFromSuperview];
    [_whiteBgView removeFromSuperview];
    _blackBgView = nil;
    _whiteBgView = nil;
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}
- (void)interPercentFinish:(CGFloat)scale {
    id<UIViewControllerContextTransitioning> transitionContext = _transitionContext;
    UIView *container = [transitionContext containerView];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [container addSubview:toView];
    UIView *imageWhiteBgView = [[UIView alloc] initWithFrame:_photoBrowserTransition.sourImageFrame];
    imageWhiteBgView.backgroundColor = [UIColor whiteColor];
    [container addSubview:imageWhiteBgView];
    UIView *bgView = [[UIView alloc] initWithFrame:container.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = _blackBgView.alpha;
    [container addSubview:bgView];
    UIImageView *transitionImageView = [[UIImageView alloc] initWithImage:_photoBrowserTransition.transitionImage];
    transitionImageView.clipsToBounds = YES;
    transitionImageView.contentMode = UIViewContentModeScaleAspectFill;
    transitionImageView.frame = _photoBrowserTransition.currentPanGesImageFrame;
    [container addSubview:transitionImageView];
    if (self.photoBrowserTransition.openSpring) {
        [UIView animateWithDuration:self.photoBrowserTransition.duration delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
            transitionImageView.frame = self.photoBrowserTransition.sourImageFrame;
            bgView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.blackBgView removeFromSuperview];
            [self.whiteBgView removeFromSuperview];
            self.blackBgView = nil;
            self.whiteBgView = nil;
            [bgView removeFromSuperview];
            [imageWhiteBgView removeFromSuperview];
            [transitionImageView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }else {
        [UIView animateWithDuration:self.photoBrowserTransition.duration animations:^{
            transitionImageView.frame = self.photoBrowserTransition.sourImageFrame;
            bgView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.blackBgView removeFromSuperview];
            [self.whiteBgView removeFromSuperview];
            self.blackBgView = nil;
            self.whiteBgView = nil;
            [bgView removeFromSuperview];
            [imageWhiteBgView removeFromSuperview];
            [transitionImageView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    _transitionContext = transitionContext;
    [self beginInterPercent];
}
- (void)beginInterPercent {
     id<UIViewControllerContextTransitioning> transitionContext = _transitionContext;
    UIView *container = [transitionContext containerView];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [container addSubview:toView];
    _whiteBgView = [[UIView alloc] initWithFrame:_photoBrowserTransition.sourImageFrame];
    _whiteBgView.backgroundColor = [UIColor whiteColor];
    [container addSubview:_whiteBgView];
    _blackBgView = [[UIView alloc] initWithFrame:container.bounds];
    _blackBgView.backgroundColor = [UIColor blackColor];
    [container addSubview:_blackBgView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    fromView.backgroundColor = [UIColor clearColor];
    [container addSubview:fromView];
}
@end
