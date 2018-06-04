# LWTools
工作中常用的方法封装

### 1.view添加分类，方便布局
```
//例如：
view.height
view.width
view.left
view.top
view.right
view.bottom
view.centerX
view.centerY
view.size
view.origin
```

### 2.手机可用存储空间的获取
```
//导入YGDeviceSpaceTool.h
/** 计算本机剩余存储空间 **/
+ (long long)deviceFreeSpace;
/** 外界传入一个size，判断本机空闲空间是否足够 **/
+ (BOOL)deviceSpaceIsEnough:(long long)size;

```

### 3.文件的加密操作
```
/** 判断文件是否加密过 **/
+ (BOOL)isFileEncry:(NSString *)filePath;
/** 给文件加密 **/
+ (void)encryFile:(NSString *)filePath;
/** 给加密过的文件追加后缀 **/
+ (void)appendSuffixToFile:(NSString *)filePath;
```

### 4.文件的解密操作
```
/** 给文件解密 **/
+ (void)descryFile:(NSString *)filePath;
```

### 5.由view生成图片
![gif动图展示](https://github.com/guyuliunian/LWTools/blob/master/从View生成图片.gif)
```
- (UIImage *)getImageFromView {
CGFloat scale = [UIScreen mainScreen].scale;
UIGraphicsBeginImageContextWithOptions(self.lw_size, NO, scale);
[self.layer renderInContext:UIGraphicsGetCurrentContext()];
UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
return image;
}
```

### 6.简单的选择栏封装(不带滚动)

### 7.类似微信的图片浏览器
![gif动图展示](https://github.com/guyuliunian/LWTools/blob/master/类似微信图片浏览.gif)

### 8.多种加载动画效果示例
![gif动图展示](https://github.com/guyuliunian/LWTools/blob/master/多种加载动画.gif)

### 9.点赞动画
![gif动图展示](https://github.com/guyuliunian/LWTools/blob/master/点赞动画.gif)

### 10.scrollView长图生成
