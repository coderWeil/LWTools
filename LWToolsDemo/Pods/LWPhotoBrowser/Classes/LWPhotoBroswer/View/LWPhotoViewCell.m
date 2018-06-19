//
//  LWPhotoViewCell.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface LWPhotoViewCell ()
@property (nonatomic,strong) LWPhotoModel *model;
@property (nonatomic,strong) CAShapeLayer *progressLayer;
@end

@implementation LWPhotoViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self loadSubviews];
    }
    return self;
}
- (void)loadSubviews {
    _photoZoomView = [[LWPhotoZoomView alloc] initWithFrame:CGRectMake(0, 0, LW_SCREENWIDTH, LW_SCREENHEIGHT)];
    _photoZoomView.backgroundColor = [UIColor blackColor];
    _photoZoomView.zoomScale = 1.0;
    __weak typeof(self) wsf = self;
    _photoZoomView.tapImageBlock = ^{
        if (wsf.delegate && [wsf.delegate respondsToSelector:@selector(didClickImageView:)]) {
            [wsf.delegate didClickImageView:wsf.index];
        }
    };
    [self.contentView addSubview:_photoZoomView];
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = CGRectMake((_photoZoomView.frame.size.width - 40) / 2.0, (_photoZoomView.frame.size.height - 40) / 2.0, 40, 40);
    _progressLayer.cornerRadius = 20;
    _progressLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(_progressLayer.bounds, 7, 7) cornerRadius:(40 / 2.0 - 7)];
    _progressLayer.path = path.CGPath;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    _progressLayer.lineWidth = 4.0;
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.strokeStart = 0;
    _progressLayer.strokeEnd = 0;
    _progressLayer.hidden = YES;
    [self.layer addSublayer:_progressLayer];
}
- (void)updateCellWithModel:(LWPhotoModel *)model {
    _model = model;
    UIImageView *imageView = _photoZoomView.zoomImageView;
    imageView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.8];
    NSString *imageURL = nil;
    __weak typeof(self) wsf = self;
    if (model.image) {
        imageView.image = model.image;
        [self setPhotoImage:model.image];
    }else if (model.image_thumb_url.length > 0) {
        imageURL = model.image_thumb_url;
    }
    if (model.image_url.length > 0) {
        imageURL = model.image_url;
    }
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:model.image options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        CGFloat progress = receivedSize / (float)expectedSize;
        progress = progress < 0.01 ? 0.01 : progress > 1 ? 1 : progress;
        if (isnan(progress)) {
            progress = 0;
        }
        wsf.progressLayer.hidden = NO;
        wsf.progressLayer.strokeEnd = progress;
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (!wsf) {
            return ;
        }
        wsf.progressLayer.hidden = YES;
        if (!error) {
            [wsf setPhotoImage:image];
            [wsf.photoZoomView adjustImageViewFrame];
        }
    }];
}
- (void)setPhotoImage:(UIImage *)image {
    CGSize size = [self backImageSize:image];
    // 将scrollview的contentSize设置成缩放前
    _photoZoomView.contentSize = CGSizeMake(size.width, size.height);
    _photoZoomView.contentOffset = CGPointMake(0, 0);
    CGFloat imageY = (_photoZoomView.frame.size.height - size.height) * 0.5;
    imageY = imageY > 0 ? imageY: 0;
    _photoZoomView.zoomImageView.frame = CGRectMake(0, imageY, _photoZoomView.frame.size.width, size.height);
}
- (CGSize)backImageSize:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    if (LW_SCREENWIDTH < size.width) {
        newSize.width = LW_SCREENWIDTH;
    }else {
        newSize.width = size.width;
    }
    newSize.height = newSize.width / size.width * size.height;
    
    return newSize;
}
@end
