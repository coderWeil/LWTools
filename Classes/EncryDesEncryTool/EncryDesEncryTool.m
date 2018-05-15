//
//  EncryDesEncryTool.m
//  AllYoga
//
//  Created by weil on 2018/2/27.
//  Copyright © 2018年 AllYoga. All rights reserved.
//

#import "EncryDesEncryTool.h"

@implementation EncryDesEncryTool
+ (NSUInteger)PrefixDataLength {
    NSUInteger length = -1;
    length = [prefix_encry dataUsingEncoding:NSUTF8StringEncoding].length;
    return length;
}
@end
