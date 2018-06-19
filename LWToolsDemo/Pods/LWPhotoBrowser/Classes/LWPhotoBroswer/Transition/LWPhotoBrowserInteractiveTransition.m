//
//  LWPhotoBrowserInteractiveTransition.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoBrowserInteractiveTransition.h"
#import "LWPhotoBrowserDrivenInteractive.h"
#import "LWPhotoBrowserPushTransition.h"
#import "LWPhotoBrowserPopTransition.h"

@interface LWPhotoBrowserInteractiveTransition ()
@property (nonatomic,strong) LWPhotoBrowserPushTransition *push;
@property (nonatomic,strong) LWPhotoBrowserPopTransition *pop;
@property (nonatomic,strong) LWPhotoBrowserDrivenInteractive *percentInractive;
@end

@implementation LWPhotoBrowserInteractiveTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.push;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.pop;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    
    return nil;//push时不加手势交互
}
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (self.photoBrowserTransition.panGestureRecognizer)
        return self.percentInractive;
    else
        return nil;
    
}


- (void)setPhotoBrowserTransition:(LWPhotoBrowserTransition *)photoBrowserTransition {
    _photoBrowserTransition = photoBrowserTransition;
    self.push.photoBrowserTransition = photoBrowserTransition;
    self.pop.photoBrowserTransition = photoBrowserTransition;
}

- (LWPhotoBrowserPushTransition *)push {
    if (!_push) {
        _push = [[LWPhotoBrowserPushTransition alloc] init];
    }
    return _push;
}
- (LWPhotoBrowserPopTransition *)pop {
    if (!_pop) {
        _pop = [[LWPhotoBrowserPopTransition alloc] init];
    }
    return _pop;
}
- (LWPhotoBrowserDrivenInteractive *)percentInractive {
    if (!_percentInractive) {
        _percentInractive = [[LWPhotoBrowserDrivenInteractive alloc] initWithTransition:self.photoBrowserTransition];
    }
    return _percentInractive;
}
@end
