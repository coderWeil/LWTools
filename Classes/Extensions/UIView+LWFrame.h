//
//  UIView+LWFrame.h
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LWFrame)

@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat bottom;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;

/** 从view生成一张图片 **/
- (UIImage *)getImageFromView;

@end
