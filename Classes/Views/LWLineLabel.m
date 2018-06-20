//
//  LWLineLabel.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/24.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWLineLabel.h"

@interface LWLineLabel ()
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIView *lineView;
@end

@implementation LWLineLabel

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
    _textLabel = [[UILabel alloc] init];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_textLabel];
    
    _lineView = [[UIView alloc] init];
    [self addSubview:_lineView];
}
- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    _textLabel.font = textFont;
}
- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _textLabel.textColor = textColor;
}
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    _lineView.backgroundColor = lineColor;
}
- (void)setText:(NSString *)text {
    _text = text;
    _textLabel.text = text;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _textLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 1);
    _lineView.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
}
@end
