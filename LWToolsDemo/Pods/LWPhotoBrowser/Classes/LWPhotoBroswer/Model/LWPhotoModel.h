//
//  LWPhotoModel.h
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LWPhotoModel : NSObject
@property (nonatomic,copy) NSString *image_url;
@property (nonatomic,copy) NSString *image_thumb_url;
@property (nonatomic,strong) UIImage *image;
@end
