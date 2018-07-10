//
//  LWWindowAlert.m
//  LWToolsDemo
//
//  Created by weil on 2018/6/12.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWWindowAlert.h"
#import <UIKit/UIKit.h>

static UIWindow *_customWindow;

@implementation LWWindowAlert
+ (void)enableCustomWindowAlert {
    if (_customWindow == nil) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _customWindow = [[UIWindow alloc] init];
            _customWindow.frame = [UIApplication sharedApplication].statusBarFrame;
            _customWindow.backgroundColor = [UIColor clearColor];
            _customWindow.windowLevel = UIWindowLevelAlert;
            [_customWindow addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTopWindowAlert)]];
            _customWindow.hidden = NO;
        });
    }else {
        _customWindow.hidden = NO;
    }
}
+ (void)disableCustomWindowAlert {
    _customWindow.hidden = YES;
    _customWindow = nil;
}
+ (void)clickTopWindowAlert {
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    [self enumerateAllScrollViewsInView:keywindow];
}
+ (void)enumerateAllScrollViewsInView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        [self enumerateAllScrollViewsInView:subView];
    }
    if (![view isKindOfClass:[UIScrollView class]]) {
        return;
    }
    UIScrollView *scrollView = (UIScrollView *)view;
    CGRect scrollViewRect = [scrollView convertRect:scrollView.bounds toView:nil];
    CGRect windowRect = [UIApplication sharedApplication].keyWindow.bounds;
    if (!CGRectIntersectsRect(scrollViewRect, windowRect)) {
        return;
    }
    [scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}
@end
