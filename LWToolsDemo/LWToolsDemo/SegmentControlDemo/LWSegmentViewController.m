//
//  LWSegmentViewController.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/9.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWSegmentViewController.h"
#import "LWSegmentControl.h"
#import "UIView+LWFrame.h"

@interface LWSegmentViewController ()
@property (nonatomic,strong) LWSegmentControl *segmentControl;
@end

@implementation LWSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _segmentControl = [[LWSegmentControl alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 50) items:@[@"标题1",@"标题标题标题",@"课程(103节)"]];
    _segmentControl.normalFont = [UIFont systemFontOfSize:12];
    _segmentControl.selectedFont = [UIFont systemFontOfSize:12];
    _segmentControl.normalColor = [UIColor lightGrayColor];
    _segmentControl.selectedColor = [UIColor blackColor];
    _segmentControl.progressColor = [UIColor blackColor];
    _segmentControl.lineViewColor = [UIColor lightGrayColor];
    _segmentControl.itemMargin = 10;
    _segmentControl.enableTextAnimation = NO;
    _segmentControl.didClickItemAtIndex = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [_segmentControl setLineViewShow:YES];
    [_segmentControl setProgressShow:YES];
    [_segmentControl reloadItems];
    [self.view addSubview:_segmentControl];
    [_segmentControl setCurrentSelectedIndex:1];
    [_segmentControl showBadgeAtIndex:0];
    [_segmentControl showBadgeAtIndex:2];
}

@end
