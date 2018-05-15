//
//  LWAnimationButton.h
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWAnimationButton : UIButton
@property (nonatomic,strong) UIImage *particleImage;
@property (nonatomic,assign) CGFloat particleScale;
@property (nonatomic,assign) CGFloat particleScaleRange;
/** 开始动画 **/
- (void)startAnimation;
/** 弹出 **/
- (void)popOutSideWithDuration:(NSTimeInterval)duration;
/** 弹入 **/
- (void)popInSideWithDuration:(NSTimeInterval)duration;

@end
