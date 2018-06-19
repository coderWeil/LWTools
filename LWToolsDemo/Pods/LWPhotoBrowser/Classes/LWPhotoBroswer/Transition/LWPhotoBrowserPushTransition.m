//
//  LWPhotoBrowserPushTransition.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoBrowserPushTransition.h"
#import "LWPhotoBrowserTransition.h"

@implementation LWPhotoBrowserPushTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.photoBrowserTransition.duration;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
   //转场过渡的容器
    UIView *containerView = [transitionContext containerView];
    //将要进入的目标界面
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.hidden = YES;
    [containerView addSubview:toView];
   //图片白色背景，营造图片跟随动画走的效果
    UIView *imageWhitBgView = [[UIView alloc] initWithFrame:[_photoBrowserTransition.sourceImagesFrames[_photoBrowserTransition.transitionImageIndex] CGRectValue]];
    imageWhitBgView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:imageWhitBgView];
    //黑色渐变背景
    UIView *blackBgView = [[UIView alloc] initWithFrame:containerView.bounds];
    blackBgView.backgroundColor = [UIColor blackColor];
    blackBgView.alpha = 0;
    [containerView addSubview:blackBgView];
    //过渡图片，由小到大
    UIImageView *transitionImageView = [[UIImageView alloc] initWithImage:_photoBrowserTransition.transitionImage];
    transitionImageView.contentMode = UIViewContentModeScaleAspectFit;
    transitionImageView.frame = [_photoBrowserTransition.sourceImagesFrames[_photoBrowserTransition.transitionImageIndex] CGRectValue];
    [containerView addSubview:transitionImageView];
    //动画
    if (self.photoBrowserTransition.openSpring) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
            transitionImageView.frame = containerView.bounds;
            blackBgView.alpha = 1.0;
        } completion:^(BOOL finished) {
            toView.hidden = NO;
            [imageWhitBgView removeFromSuperview];
            [transitionImageView removeFromSuperview];
            [blackBgView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }else {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            transitionImageView.frame = containerView.bounds;
            blackBgView.alpha = 1.0;
        } completion:^(BOOL finished) {
            toView.hidden = NO;
            [imageWhitBgView removeFromSuperview];
            [transitionImageView removeFromSuperview];
            [blackBgView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    
}
@end
