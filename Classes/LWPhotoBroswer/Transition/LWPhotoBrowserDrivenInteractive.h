//
//  LWPhotoBrowserDrivenInteractive.h
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LWPhotoBrowserTransition;
@interface LWPhotoBrowserDrivenInteractive : UIPercentDrivenInteractiveTransition
- (instancetype)initWithTransition:(LWPhotoBrowserTransition *)transition;
@end
