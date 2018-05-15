//
//  LWPhotoBrowserPopTransition.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoBrowserPopTransition.h"
#import "LWPhotoBrowserTransition.h"

@implementation LWPhotoBrowserPopTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.photoBrowserTransition.duration;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *container = [transitionContext containerView];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [container addSubview:toView];
    CGRect fromFrame = CGRectMake((LW_SCREENWIDTH - _photoBrowserTransition.destImageFrame.size.width) * 0.5, _photoBrowserTransition.destImageFrame.origin.y, _photoBrowserTransition.destImageFrame.size.width, _photoBrowserTransition.destImageFrame.size.height);
    CGRect toFrame = [_photoBrowserTransition.sourceImagesFrames[_photoBrowserTransition.transitionImageIndex] CGRectValue];
    UIView *whiteImageBgView= [[UIView alloc] initWithFrame:[_photoBrowserTransition.sourceImagesFrames[_photoBrowserTransition.transitionImageIndex] CGRectValue]];
    whiteImageBgView.backgroundColor = [UIColor whiteColor];
    [container addSubview:whiteImageBgView];
    UIView *blackBgView = [[UIView alloc] initWithFrame:container.bounds];
    blackBgView.backgroundColor = [UIColor blackColor];
    blackBgView.alpha = 1.0;
    [container addSubview:blackBgView];
    UIImageView *transitionImageView = [[UIImageView alloc] initWithImage:_photoBrowserTransition.transitionImage];
    transitionImageView.contentMode = UIViewContentModeScaleAspectFill;
    transitionImageView.clipsToBounds = YES;
    transitionImageView.frame = fromFrame;
    [container addSubview:transitionImageView];
    if (self.photoBrowserTransition.openSpring) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
            //避免frame数值都为零的处理
            CGRect imageFrame = toFrame;
            if (imageFrame.size.width == 0 && imageFrame.size.height == 0) {
                CGFloat defaultWidth = 5;
                imageFrame = CGRectMake((LW_SCREENWIDTH - defaultWidth) * 0.5, (LW_SCREENHEIGHT - defaultWidth) * 0.5, defaultWidth, defaultWidth);
            }
            transitionImageView.frame = imageFrame;
            blackBgView.alpha = 0;
        } completion:^(BOOL finished) {
            [blackBgView removeFromSuperview];
            [whiteImageBgView removeFromSuperview];
            [transitionImageView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }else {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            CGRect imageFrame = toFrame;
            if (imageFrame.size.width == 0 && imageFrame.size.height == 0) {
                CGFloat defaultWidth = 5;
                imageFrame = CGRectMake((LW_SCREENWIDTH - defaultWidth) * 0.5, (LW_SCREENHEIGHT - defaultWidth) * 0.5, defaultWidth, defaultWidth);
            }
            transitionImageView.frame = imageFrame;
            blackBgView.alpha = 0;
        } completion:^(BOOL finished) {
            [blackBgView removeFromSuperview];
            [whiteImageBgView removeFromSuperview];
            [transitionImageView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}
@end
