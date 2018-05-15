//
//  UIView+LWFrame.h
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LWFrame)
@property (nonatomic, assign) CGFloat lw_x;
@property (nonatomic, assign) CGFloat lw_y;
@property (nonatomic, assign) CGFloat lw_centerX;
@property (nonatomic, assign) CGFloat lw_centerY;
@property (nonatomic, assign) CGFloat lw_width;
@property (nonatomic, assign) CGFloat lw_height;
@property (nonatomic, assign) CGSize lw_size;
@property (nonatomic, assign) CGPoint lw_origin;
@property (nonatomic, assign) CGFloat lw_minX;
@property (nonatomic, assign) CGFloat lw_minY;
@property (nonatomic, assign) CGFloat lw_maxX;
@property (nonatomic, assign) CGFloat lw_maxY;
/** 从view生成一张图片 **/
- (UIImage *)getImageFromView;

@end
