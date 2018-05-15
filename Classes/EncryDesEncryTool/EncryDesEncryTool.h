//
//  EncryDesEncryTool.h
//  AllYoga
//
//  Created by weil on 2018/2/27.
//  Copyright © 2018年 AllYoga. All rights reserved.
//

#import <Foundation/Foundation.h>

static  NSString *const prefix_encry = @"AllYoga";
static  NSUInteger const encry_length = 100;

@interface EncryDesEncryTool : NSObject
/** 计算所加字节的长度 **/
+ (NSUInteger)PrefixDataLength;
@end
