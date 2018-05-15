//
//  LWPhotoZoomView.h
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LW_SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define LW_SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface LWPhotoZoomView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView *zoomImageView;
@property (nonatomic,copy) void(^tapImageBlock)(void);
- (void)adjustImageViewFrame;
@end
