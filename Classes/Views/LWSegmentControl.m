//
//  LWSegmentControl.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/9.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWSegmentControl.h"
#import "UIView+LWFrame.h"

static NSInteger const LW_ITEM_TAG = 10;
@interface LWSegmentControl ()
@property (nonatomic,strong) NSArray *itemsArr;
@property (nonatomic,strong) UIButton *currentButton;
@property (nonatomic,strong) NSMutableArray *buttonArr;
@property (nonatomic,assign,readwrite) NSInteger currentIndex;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIView *progressView;
@end

@implementation LWSegmentControl
- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items {
    self = [super initWithFrame:frame];
    if (self) {
        _itemsArr = items;
        self.backgroundColor = [UIColor whiteColor];
        _itemMargin = 0;
        _enableTextAnimation = YES;
        _topMargin = 0;
        [self _loadSubviews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _itemMargin = 0;
        _enableTextAnimation = YES;
        _topMargin = 0;
        [self _loadSubviews];
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _itemMargin = 0;
        _enableTextAnimation = YES;
        _topMargin = 0;
        [self _loadSubviews];
    }
    return self;
}
- (void)_loadSubviews {
    _buttonArr = [NSMutableArray array];
    for (int i = 0; i < _itemsArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:_itemsArr[i] forState:UIControlStateNormal];
        button.tag = LW_ITEM_TAG + i;
        [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [_buttonArr addObject:button];
    }
    _currentIndex = -1;
    _lineView = [UIView new];
    _lineView.frame = CGRectMake(0, self.lw_height - 0.5, self.lw_width, 0.5);
    [self addSubview:_lineView];
    _progressView = [[UIView alloc] init];
    [self addSubview:_progressView];
}
- (void)setLineViewShow:(BOOL)show {
    _lineView.hidden = !show;
}
- (void)setProgressShow:(BOOL)show {
    _progressView.hidden = !show;
}
- (void)setItems:(NSArray *)items {
    _itemsArr = items;
    [self _loadSubviews];
}
- (void)reloadItems {
    CGFloat itemTotalWidth = 0;
    for (int i = 0; i < _buttonArr.count; i++) {
        UIButton *button = _buttonArr[i];
        [button setTitleColor:_normalColor forState:UIControlStateNormal];
        [button setTitleColor:_selectedColor forState:UIControlStateSelected];
        button.titleLabel.font = (i == 0 ? _selectedFont : _normalFont);
        NSString *title = _itemsArr[i];
        CGSize titleSize = CGSizeZero;
        if (i == 0) {
             titleSize = [title boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_selectedFont} context:nil].size;
            _currentButton = button;
            _currentButton.selected = YES;
        }else {
             titleSize = [title boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_selectedFont} context:nil].size;
        }
        itemTotalWidth += titleSize.width + 30;
    }
    CGFloat xPos = (self.lw_width - itemTotalWidth - (_buttonArr.count - 1) * _itemMargin) / 2.0;
    UIButton *lastItem = nil;
    for (int i = 0; i < _buttonArr.count; i++) {
        UIButton *button = _buttonArr[i];
        NSString *title = _itemsArr[i];
        NSArray *titleArr = [title componentsSeparatedByString:@"("];
        NSString *text = titleArr.firstObject;
        CGSize textSize;
        CGSize titleSize;
        if (i == 0) {
            textSize =  [text boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_selectedFont} context:nil].size;
            titleSize = [title boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_selectedFont} context:nil].size;
        }else {
            textSize = [text boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_normalFont} context:nil].size;
            titleSize = [title boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_normalFont} context:nil].size;
        }
        CGFloat btnCenterX = 0;
        CGFloat progressCenterX = 0;
        if (lastItem == nil) {
            btnCenterX = xPos + (titleSize.width + 30) * 0.5;
            progressCenterX = xPos + (textSize.width + 30) * 0.5;
        }else {
            btnCenterX = lastItem.lw_maxX + _itemMargin + (titleSize.width + 30) * 0.5;
            progressCenterX = lastItem.lw_maxX + _itemMargin + (textSize.width + 30) * 0.5;
        }
        button.center = CGPointMake(btnCenterX, _topMargin + (self.lw_height - _topMargin) * 0.5);
        button.bounds = CGRectMake(0, 0, titleSize.width + 30 , titleSize.height);
        if (i == 0) {
            if (_enableTextAnimation) {
                button.transform = CGAffineTransformMakeScale(1.2, 1.2);
            }
            _progressView.center = CGPointMake(progressCenterX, (self.lw_height - button.lw_maxY) / 3.0 + button.lw_maxY);
            _progressView.bounds = CGRectMake(0, 0, 15, 2);
        }
        lastItem = button;
    }
    _progressView.backgroundColor = _progressColor;
    _lineView.backgroundColor = _lineViewColor;

}
- (void)setCurrentSelectedIndex:(NSInteger)index {
    if (_currentIndex == index) {
        return;
    }
    for (UIButton *button in _buttonArr) {
        button.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }
    _currentIndex = index;
    _currentButton.selected = NO;
    _currentButton.titleLabel.font = _normalFont;
    _currentButton = _buttonArr[index];
    if (_enableTextAnimation) {
        _currentButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }
    NSString *title = _itemsArr[index];
    NSArray *titleArr = [title componentsSeparatedByString:@"("];
    CGSize textSize = CGSizeZero;
    if (titleArr.count > 1) {
        NSString *text = [NSString stringWithFormat:@"(%@",titleArr.lastObject];
        textSize =  [text boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_selectedFont,NSForegroundColorAttributeName:_selectedColor} context:nil].size;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.progressView.center = CGPointMake(self.currentButton.lw_centerX - textSize.width * 0.5 * (self.enableTextAnimation ? 1.2 : 1.0),  (self.lw_height - self.currentButton.lw_maxY) / 3.0 + self.currentButton.lw_maxY);
    } completion:^(BOOL finished) {
        self.currentButton.selected = YES;
        self.currentButton.titleLabel.font = self.selectedFont;
    }];

}
- (void)didClickButton:(UIButton *)button {
    if (_currentButton == button) {
        return;
    }
    if (_didClickItemAtIndex) {
        _didClickItemAtIndex(button.tag - LW_ITEM_TAG);
    }
    [self setCurrentSelectedIndex:button.tag - LW_ITEM_TAG];
}
@end
