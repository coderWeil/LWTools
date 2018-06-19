//
//  LWPhotoBrowserPopTransition.h
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LWPhotoBrowserTransition;
@interface LWPhotoBrowserPopTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic,strong) LWPhotoBrowserTransition *photoBrowserTransition;
@end
