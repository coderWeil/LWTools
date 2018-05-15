//
//  UIView+LWFrame.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "UIView+LWFrame.h"

@implementation UIView (LWFrame)
- (void)setLw_x:(CGFloat)lw_x
{
    CGRect frame = self.frame;
    frame.origin.x = lw_x;
    self.frame = frame;
}

- (void)setLw_y:(CGFloat)lw_y
{
    CGRect frame = self.frame;
    frame.origin.y = lw_y;
    self.frame = frame;
}

- (CGFloat)lw_x
{
    return self.frame.origin.x;
}

- (CGFloat)lw_y
{
    return self.frame.origin.y;
}

- (void)setLw_centerX:(CGFloat)lw_centerX
{
    CGPoint center = self.center;
    center.x = lw_centerX;
    self.center = center;
}

- (CGFloat)lw_centerX
{
    return self.center.x;
}

- (void)setLw_centerY:(CGFloat)lw_centerY
{
    CGPoint center = self.center;
    center.y = lw_centerY;
    self.center = center;
}

- (CGFloat)lw_centerY
{
    return self.center.y;
}

- (void)setLw_width:(CGFloat)lw_width
{
    CGRect frame = self.frame;
    frame.size.width = lw_width;
    self.frame = frame;
}

- (void)setLw_height:(CGFloat)lw_height
{
    CGRect frame = self.frame;
    frame.size.height = lw_height;
    self.frame = frame;
}

- (CGFloat)lw_height
{
    return self.frame.size.height;
}

- (CGFloat)lw_width
{
    return self.frame.size.width;
}

- (void)setLw_size:(CGSize)lw_size
{
    CGRect frame = self.frame;
    frame.size = lw_size;
    self.frame = frame;
}

- (CGSize)lw_size
{
    return self.frame.size;
}

- (void)setLw_origin:(CGPoint)lw_origin
{
    CGRect frame = self.frame;
    frame.origin = lw_origin;
    self.frame = frame;
}

- (CGPoint)lw_origin
{
    return self.frame.origin;
}

- (void)setLw_minX:(CGFloat)lw_minX
{
    CGRect frame = self.frame;
    frame.origin.x = lw_minX;
    self.frame = frame;
}

- (CGFloat)lw_minX
{
    return CGRectGetMinX(self.frame);
}

- (void)setLw_minY:(CGFloat)lw_minY
{
    CGRect frame = self.frame;
    frame.origin.y = lw_minY;
    self.frame = frame;
}

- (CGFloat)lw_minY
{
    return CGRectGetMinY(self.frame);
}

- (void)setLw_maxX:(CGFloat)lw_maxX
{
    self.lw_maxX = self.lw_x +self.lw_width;
}

- (CGFloat)lw_maxX
{
    return CGRectGetMaxX(self.frame);
}

- (void)setLw_maxY:(CGFloat)lw_maxY
{
    self.lw_minY = self.lw_y + self.lw_height;
}

- (CGFloat)lw_maxY{
    return CGRectGetMaxY(self.frame);
}

- (UIImage *)getImageFromView {
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.lw_size, NO, scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
@end
