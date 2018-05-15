//
//  LWSegmentControl.h
//  LWToolsDemo
//
//  Created by weil on 2018/5/9.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWSegmentControl : UIView
/** 正常时候文字大小 **/
@property (nonatomic,strong) UIFont *normalFont;
/** 选中时候文字大小 **/
@property (nonatomic,strong) UIFont *selectedFont;
/** 正常时候文字颜色 **/
@property (nonatomic,strong) UIColor *normalColor;
/** 选中时候文字颜色 **/
@property (nonatomic,strong) UIColor *selectedColor;
/** 顶部细线的颜色 **/
@property (nonatomic,strong) UIColor *lineViewColor;
/** 指示器的颜色 **/
@property (nonatomic,strong) UIColor *progressColor;
/** 两个item之间的间距 **/
@property (nonatomic,assign) CGFloat itemMargin;
/** 当前选中的item的下标 **/
@property (nonatomic,assign,readonly) NSInteger currentIndex;
/** 选中item的回调 **/
@property (nonatomic,copy) void(^didClickItemAtIndex)(NSInteger index);
/** 是否显示底部细线 **/
- (void)setLineViewShow:(BOOL)show;
/** 是否显示指示器 **/
- (void)setProgressShow:(BOOL)show;
- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items;
- (void)setItems:(NSArray *)items;
/** 刷新 **/
- (void)reloadItems;
/** 设置选中的下标 **/
- (void)setCurrentSelectedIndex:(NSInteger)index;
@end
