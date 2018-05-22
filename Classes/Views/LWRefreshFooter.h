//
//  LWRereshFooter.h
//  LWToolsDemo
//
//  Created by weil on 2018/5/22.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "MJRefreshBackFooter.h"
#import "LWAnimationView.h"

@interface LWRefreshFooter : MJRefreshBackFooter
//填充色
@property (nonatomic,strong) UIColor *loadingColor;
@property (nonatomic,assign) CGFloat loadingSize;
@property (nonatomic,assign) LWAnimationViewStyle style;
@end
