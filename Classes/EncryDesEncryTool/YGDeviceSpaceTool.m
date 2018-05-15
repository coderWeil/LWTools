//
//  YGDeviceSpaceTool.m
//  AllYoga
//
//  Created by weil on 2018/3/14.
//  Copyright © 2018年 AllYoga. All rights reserved.
//

#import "YGDeviceSpaceTool.h"
#import <sys/param.h>
#import <sys/mount.h>
#import <mach/mach.h>

@implementation YGDeviceSpaceTool

+ (BOOL)deviceSpaceIsEnough:(long long)size {
    struct statfs buf;
    long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (long long)(buf.f_bsize * buf.f_bfree);
    }
    if (freeSpace <= size) {
        return NO;
    }
    return YES;
}

+ (long long)deviceFreeSpace {
    struct statfs buf;
    long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (long long)(buf.f_bsize * buf.f_bfree);
    }
    return freeSpace;
}


@end
