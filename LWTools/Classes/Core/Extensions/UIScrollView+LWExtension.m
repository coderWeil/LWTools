//
//  UIScrollView+LWExtension.m
//  LWToolsDemo
//
//  Created by weil on 2018/6/1.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "UIScrollView+LWExtension.h"

@implementation UIScrollView (LWExtension)
- (UIImage *)captureScrollView {
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(self.contentSize, NO, [UIScreen mainScreen].scale);
    CGPoint savedContentOffset = self.contentOffset;
    CGRect savedFrame = self.frame;
    self.contentOffset = CGPointZero;
    self.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    self.contentOffset = savedContentOffset;
    self.frame = savedFrame;
    UIGraphicsEndImageContext();
    return image;
}

@end
