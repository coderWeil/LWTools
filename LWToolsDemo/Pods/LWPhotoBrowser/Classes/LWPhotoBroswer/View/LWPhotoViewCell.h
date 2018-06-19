//
//  LWPhotoViewCell.h
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWPhotoZoomView.h"
#import "LWPhotoModel.h"

@protocol LWPhotoViewCellDelegate <NSObject>
@optional
- (void)didClickImageView:(NSInteger)index;
@end

@interface LWPhotoViewCell : UICollectionViewCell
@property (nonatomic,weak) id<LWPhotoViewCellDelegate> delegate;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) LWPhotoZoomView *photoZoomView;
- (void)updateCellWithModel:(LWPhotoModel *)model;
@end
