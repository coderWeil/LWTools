//
//  LWPhotoZoomView.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoZoomView.h"

@interface LWPhotoZoomView ()
@property (nonatomic,assign) BOOL isSingleTap;
@end

@implementation LWPhotoZoomView
- (instancetype)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    if (self) {
        [self createZoomScrollView];
    }
    return self;
}
- (void)createZoomScrollView {
    self.delegate = self;
    _isSingleTap = NO;
    self.minimumZoomScale = 1.0f;
    self.maximumZoomScale = 3.0f;
    _zoomImageView = [[UIImageView alloc] init];
    _zoomImageView.userInteractionEnabled = YES;
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;
    _zoomImageView.clipsToBounds = YES;
    [self addSubview:_zoomImageView];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _zoomImageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGRect rect = _zoomImageView.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    if (rect.size.width < self.frame.size.width) {
        rect.origin.x = floorf((self.frame.size.width - rect.size.width) / 2.0);
    }
    if (rect.size.height < self.frame.size.height) {
        rect.origin.y = floorf((self.frame.size.height - rect.size.height) / 2.0);
    }
    _zoomImageView.frame = rect;
    self.scrollEnabled = YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    if (touch.tapCount == 1) {
        [self performSelector:@selector(singleTapClick) withObject:nil afterDelay:0.2];
    }else if (touch.tapCount == 2) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        if (!_isSingleTap) {
            CGPoint touchPoint = [touch locationInView:_zoomImageView];
            [self zoomDoubleTapWithPoint:touchPoint];
        }
    }
}
- (void)singleTapClick {
    _isSingleTap = YES;
    if (self.tapImageBlock) {
        self.tapImageBlock();
    }
}
- (void)zoomDoubleTapWithPoint:(CGPoint)touchPoint {
    if (self.zoomScale > self.minimumZoomScale) {
        [self setZoomScale:self.minimumZoomScale animated:YES];
        self.scrollEnabled = NO;
    }else {
        self.scrollEnabled = YES;
        CGFloat newZoomScale = (self.maximumZoomScale + self.minimumZoomScale) / 2.0;
        CGFloat width = self.bounds.size.width / newZoomScale;
        CGFloat height = self.bounds.size.height / newZoomScale;
        [self zoomToRect:CGRectMake(touchPoint.x - width / 2, touchPoint.y - height / 2, width, height) animated:YES];
    }
}
- (void)adjustImageViewFrame {
    if (_zoomImageView.image) {
        CGSize viewSize = self.bounds.size;
        CGSize imageSize = _zoomImageView.image.size;
        if (imageSize.width > viewSize.width || imageSize.height > viewSize.height) {
            CGFloat imageScale = imageSize.width / imageSize.height;
            CGFloat viewScale = viewSize.width / viewSize.height;
            if (viewScale > imageScale) {
                imageSize = CGSizeMake(viewSize.height * imageSize.width / imageSize.height, viewSize.height);
            }else {
                imageSize = CGSizeMake(viewSize.width, viewSize.width * imageSize.height / imageSize.width);
            }
        }
        _zoomImageView.frame = CGRectMake((viewSize.width - imageSize.width) / 2, (viewSize.height - imageSize.height) / 2.0, imageSize.width, imageSize.height);
        self.contentSize = imageSize;
        [self scrollViewDidZoom:self];
    }
}
@end
