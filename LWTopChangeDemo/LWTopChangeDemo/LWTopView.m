//
//  LWTopView.m
//  LWTopChangeDemo
//
//  Created by weil on 2018/6/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWTopView.h"

@interface LWTopView ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,assign) CGSize titleSize;
@property (nonatomic,assign) CGPoint titleSourceCenter;
@property (nonatomic,assign) CGPoint titleDestCenter;
@end

@implementation LWTopView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self _initSubviews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubviews];
    }
    return self;
}
- (void)_initSubviews {
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.backgroundColor = [UIColor redColor];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_backButton setTitle:@"左边" forState:UIControlStateNormal];
    _backButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_backButton];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = [UIColor blackColor];
    [self addSubview:_titleLabel];
}

- (void)updateTopViewWithTitle:(NSString *)title {
    _titleSize = [title sizeWithAttributes:@{NSFontAttributeName:_titleLabel.font}];
    _titleLabel.text = title;
    _backButton.center = CGPointMake(20 + 50 * 0.5, 34 + 25 * 0.5);
    _backButton.bounds = CGRectMake(0, 0, 50, 25);
    
    _titleLabel.frame = CGRectMake(CGRectGetMinX(_backButton.frame), CGRectGetMaxY(_backButton.frame) + 20, _titleSize.width, _titleSize.height);
    _titleSourceCenter = _titleLabel.center;
    _titleDestCenter = CGPointMake(self.frame.size.width * 0.5, _backButton.center.y);
}


- (void)updateTopViewWithScale:(CGFloat)scale {
    CGPoint center = _titleLabel.center;
    center.x = (_titleSourceCenter.x + (1-scale) * (_titleDestCenter.x - _titleSourceCenter.x));
    center.y = _titleSourceCenter.y - (1-scale) * (_titleSourceCenter.y - _titleDestCenter.y);
    _titleLabel.center = center;
    CGFloat font = 18 * scale;
    if (font < 15) {
        font = 15;
    }
    _titleLabel.font = [UIFont systemFontOfSize:font];
    [_titleLabel layoutIfNeeded];
}

@end
