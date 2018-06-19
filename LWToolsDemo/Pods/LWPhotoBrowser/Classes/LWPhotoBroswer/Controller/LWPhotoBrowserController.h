//
//  LWPhotoBrowserController.h
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWPhotoBrowserInteractiveTransition.h"

@class LWPhotoModel;
@interface LWPhotoBrowserController : UIViewController
@property (nonatomic,strong) LWPhotoBrowserInteractiveTransition *animatedTransition;
@property (nonatomic,strong) NSArray<LWPhotoModel*> *photosArray;
@end
