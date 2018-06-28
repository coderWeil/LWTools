//
//  EncryTool.h
//  AllYoga
//
//  Created by weil on 2018/2/27.
//  Copyright © 2018年 AllYoga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryTool : NSObject
/** 判断文件是否加密过 **/
+ (BOOL)isFileEncry:(NSString *)filePath;
/** 给文件加密 **/
+ (void)encryFile:(NSString *)filePath;
/** 给加密过的文件追加后缀 **/
+ (void)appendSuffixToFile:(NSString *)filePath;
@end
