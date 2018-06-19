//
//  LWPhotoBrowserTransition.h
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LW_SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define LW_SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface LWPhotoBrowserTransition : NSObject

/** 转场过渡所需要的图片，分为两种，进入图片浏览和退出图片浏览的时候都需要传值，进入的时候是原图，退出的时候是浏览后的图 **/
@property (nonatomic,strong) UIImage *transitionImage;
/**浏览图片的下标 **/
@property (nonatomic,assign) NSInteger transitionImageIndex;
/** 进入图片浏览器所需要传的值，标识一组图片的原始位置，方便退出的时候定位**/
@property (nonatomic,strong) NSArray<NSValue *> *sourceImagesFrames;
/** 退出图片浏览时候的滑动手势 **/
@property (nonatomic,strong) UIPanGestureRecognizer *panGestureRecognizer;
/** 退出时，当前滑动对应图片的frame **/
@property (nonatomic,assign) CGRect currentPanGesImageFrame;
/** 通过下标计算出来的图片的frame，这个主要是为定位和动画做准备 **/
@property (nonatomic,assign,readonly) CGRect sourImageFrame;
/** 通过下标计算的在浏览器中显示的图片的frame **/
@property (nonatomic,assign,readonly) CGRect destImageFrame;
/** 是否开启弹簧效果 **/
@property (nonatomic,assign,getter=isOpenSpring) BOOL openSpring;
/** 动画时长 **/
@property (nonatomic,assign) CGFloat duration;
@end
