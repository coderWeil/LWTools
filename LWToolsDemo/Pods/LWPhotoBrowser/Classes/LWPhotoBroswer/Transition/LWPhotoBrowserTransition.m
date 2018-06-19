//
//  LWPhotoBrowserTransition.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoBrowserTransition.h"

@implementation LWPhotoBrowserTransition

- (instancetype)init {
    self = [super init];
    if (self) {
        _duration = 0.5;
        _openSpring = YES;
    }
    return self;
}

//返回imageView在window上全屏显示时的frame
- (CGRect)backScreenImageViewRectWithImage:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    if (size.width > LW_SCREENWIDTH) {
        newSize.width = LW_SCREENWIDTH;
    }else {
        newSize.width = size.width;
    }
    newSize.height = newSize.width / size.width * size.height;
    CGFloat imageY = (LW_SCREENHEIGHT - newSize.height) * 0.5;
    CGFloat imageX = (LW_SCREENWIDTH - newSize.width) * 0.5;
    if (imageX < 0) {
        imageX = 0;
    }
    if (imageY < 0) {
        imageY = 0;
    }
    CGRect rect =  CGRectMake(0, imageY, newSize.width, newSize.height);
    
    return rect;
}

- (void)setTransitionImage:(UIImage *)transitionImage {
    _transitionImage = transitionImage;
    _destImageFrame = [self backScreenImageViewRectWithImage:transitionImage];
}
- (void)setTransitionImageIndex:(NSInteger)transitionImageIndex {
    _transitionImageIndex = transitionImageIndex;
    _sourImageFrame = [_sourceImagesFrames[transitionImageIndex] CGRectValue];
}

@end
