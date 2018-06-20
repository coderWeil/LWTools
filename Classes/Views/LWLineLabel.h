//
//  LWLineLabel.h
//  LWToolsDemo
//
//  Created by weil on 2018/5/24.
//  Copyright © 2018年 weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWLineLabel : UIControl
@property (nonatomic,strong) UIFont *textFont;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *lineColor;
@property (nonatomic,copy) NSString *text;
@end
