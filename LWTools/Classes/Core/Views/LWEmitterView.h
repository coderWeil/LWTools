//
//  LWEmitterView.h
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWEmitterView : UIView
@property (nonatomic,strong) UIImage *particleImage;
@property (nonatomic,assign) CGFloat particleScale;
@property (nonatomic,assign) CGFloat particleScaleRange;
/** 开启粒子动画 **/
- (void)startFireAnimation;
@end
