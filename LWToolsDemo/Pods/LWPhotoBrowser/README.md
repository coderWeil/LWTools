# LWPhotoBrowser
类似微信图片相册浏览的功能，包含放缩，捏合和下拉退出等
调用方式
```
//封装参数对象
LWPhotoBrowserTransition *transitionParameter = [[LWPhotoBrowserTransition alloc] init];
transitionParameter.transitionImage = cell.imageView.image;
transitionParameter.sourceImagesFrames = [self firstImageViewFrames];
transitionParameter.transitionImageIndex = index;
//    transitionParameter.openSpring = NO;
//    transitionParameter.duration = 0.25;
self.animatedTransition = nil;
self.animatedTransition.photoBrowserTransition = transitionParameter;

//传输必要参数
LWPhotoBrowserController *pictVC = [[LWPhotoBrowserController alloc] init];
pictVC.photosArray = [self browseSouceModelItemArray];
pictVC.animatedTransition = self.animatedTransition;

//设置代理
pictVC.transitioningDelegate = self.animatedTransition;
[self presentViewController:pictVC animated:YES completion:nil];

```
