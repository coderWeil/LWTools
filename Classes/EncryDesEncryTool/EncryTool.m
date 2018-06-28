//
//  EncryTool.m
//  AllYoga
//
//  Created by weil on 2018/2/27.
//  Copyright © 2018年 AllYoga. All rights reserved.
//

#import "EncryTool.h"
#import "EncryDesEncryTool.h"
#import "YGDeviceSpaceTool.h"


@implementation EncryTool

+ (BOOL)isFileEncry:(NSString *)filePath {
    
    NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (!readHandle) {
        return NO;
    }
    long long fileDataLength = [readHandle seekToEndOfFile];
    NSUInteger offset = [EncryDesEncryTool PrefixDataLength];
    if (fileDataLength < offset || fileDataLength >= [YGDeviceSpaceTool deviceFreeSpace]) {
        return NO;
    }
    [readHandle seekToFileOffset:fileDataLength - offset];
    NSData *prefixData = [readHandle readDataOfLength:offset];
    [readHandle closeFile];
    NSString *prefix = [[NSString alloc] initWithData:prefixData encoding:NSUTF8StringEncoding];
    if ([prefix isEqualToString:prefix_encry]) {
        return YES;
    }
    return NO;
}

+ (void)encryFile:(NSString *)filePath {
    if ([self isFileEncry:filePath]) {//如果加密过，不需要再加密
        return;
    }
    //1.先读前100字节的文件取文件
    NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (!readHandle) {
        return;
    }
    [readHandle seekToFileOffset:0];
    NSData *fileData = [readHandle readDataOfLength:encry_length];
    long long fileDataLength = [readHandle seekToEndOfFile];//获取文件的总长度
    [readHandle closeFile];
    if (!fileData || fileData.length < encry_length || fileDataLength >= [YGDeviceSpaceTool deviceFreeSpace]) {
        return;
    }
    //2.先给文件前某个字节取反
    unsigned char *byte = (unsigned char *)[fileData bytes];
    for (int index = 0; index < encry_length; index++,byte++) {
        *byte =  (*byte) ^ index;
    }
    //3.将取反的文件写入同步
    NSFileHandle *writeHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    if (!writeHandle) {
        return;
    }
    [writeHandle writeData:fileData];
    [writeHandle closeFile];
    [self appendSuffixToFile:filePath];
}

//给文件追加后缀
+ (void)appendSuffixToFile:(NSString *)filePath {
    //3.将取反的文件写入同步
    NSFileHandle *writeHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    if (!writeHandle) {
        return;
    }
    long long fileDataLength = [writeHandle seekToEndOfFile];
    if (fileDataLength + [EncryDesEncryTool PrefixDataLength] >= [YGDeviceSpaceTool deviceFreeSpace]) {
        [writeHandle closeFile];
        return;
    }
    //4.给文件前加后缀
    //文件指针移动到最后面
    [writeHandle seekToFileOffset:fileDataLength];
    NSData *prefixData = [prefix_encry dataUsingEncoding:NSUTF8StringEncoding];
    //将前缀字节加到后面
    [writeHandle writeData:prefixData];
    [writeHandle closeFile];
}

@end
