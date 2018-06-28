//
//  DesEncryTool.m
//  AllYoga
//
//  Created by weil on 2018/2/27.
//  Copyright © 2018年 AllYoga. All rights reserved.
//

#import "DesEncryTool.h"
#import "EncryTool.h"
#import "EncryDesEncryTool.h"
#import "YGDeviceSpaceTool.h"

@implementation DesEncryTool
+ (void)descryFile:(NSString *)filePath {
    //先判断文件是否加密
    if (![EncryTool isFileEncry:filePath]) {
        return;
    }
    //开始解密
    NSUInteger offset = [EncryDesEncryTool PrefixDataLength];
    //1.读取前缀之后的数据
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
    //2.取反
    unsigned char *byte = (unsigned char *)[fileData bytes];
    for (int index = 0; index < encry_length; index++,byte++) {
        *byte =  (*byte) ^ index;
    }
    NSFileHandle *writeHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    if (!writeHandle) {
        return;
    }
    [writeHandle writeData:fileData];
    [writeHandle truncateFileAtOffset:fileDataLength - offset];
    [writeHandle closeFile];
}
@end
