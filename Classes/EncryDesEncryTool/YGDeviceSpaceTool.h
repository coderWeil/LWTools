//
//  YGDeviceSpaceTool.h
//  AllYoga
//
//  Created by weil on 2018/3/14.
//  Copyright © 2018年 AllYoga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGDeviceSpaceTool : NSObject
/** 判断本机空闲空间是否足够 **/
+ (BOOL)deviceSpaceIsEnough:(long long)size;
/** 计算本机剩余存储空间 **/
+ (long long)deviceFreeSpace;
@end
