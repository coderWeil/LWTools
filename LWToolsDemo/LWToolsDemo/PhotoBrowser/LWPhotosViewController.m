//
//  LWPhotosViewController.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotosViewController.h"
#import "LWPhotoBrowser.h"
#import "LYPictureFirstPageCell.h"
#define CellImageSize (LW_SCREENWIDTH - 2 * 5)/ 3.0

@interface LWPhotosViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray   *imageDataArray;

@property (nonatomic, strong) NSMutableArray   *pictureImageViews;
@property (nonatomic, strong) LWPhotoBrowserInteractiveTransition *animatedTransition;
@property (nonatomic,strong) NSArray *imageURLs;

@end

@implementation LWPhotosViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = nil;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initImageData];
    
    [self.view addSubview:self.collectionView];
}

- (void)initImageData{
    
    self.imageDataArray = [NSMutableArray array];
    
    //构造图片数据
    for (int i = 1; i <= 11; i ++) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Expression%.2d",i] ofType:@"jpeg"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        
        NSDictionary *imgDic = @{@"image" : img,
                                 //@"imgUrl" : [NSString stringWithFormat:@"https://xxx.jpg",i],
                                 //@"imgUrl_thumb" : [NSString stringWithFormat:@"https://xxx_thumb.jpg",i]
                                 };
        
        [self.imageDataArray addObject:imgDic];
    }
    _imageURLs = @[@"http://ww2.sinaimg.cn/large/6204ece1gw1evvzegkumsj20k069f4hm.jpg",@"http://img.tupianzj.com/uploads/allimg/160708/9-160FQ14512951.JPG",@"http://f9.topitme.com/9/d5/59/112874511432059d59o.jpg",@"http://pic60.nipic.com/file/20150207/11284670_083602732000_2.jpg",@"http://pic2.16pic.com/00/24/38/16pic_2438497_b.jpg",@"http://cdn.duitang.com/uploads/item/201507/10/20150710045602_wHEBf.jpeg", @"http://img.52z.com/upload/news/image/20180312/20180312060838_80148.jpg",@"http://img.tupianzj.com/uploads/allimg/160708/9-160FQ14512951.JPG",@"http://f9.topitme.com/9/d5/59/112874511432059d59o.jpg",@"http://pic60.nipic.com/file/20150207/11284670_083602732000_2.jpg",@"http://pic2.16pic.com/00/24/38/16pic_2438497_b.jpg"];
    //构造图片数据
    for (int i = 1; i <= _imageURLs.count; i ++) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Expression%.2d",i] ofType:@"jpeg"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        
        NSDictionary *imgDic = @{@"image" : img,
                                 //@"imgUrl" : [NSString stringWithFormat:@"https://xxx.jpg",i],
                                 //@"imgUrl_thumb" : [NSString stringWithFormat:@"https://xxx_thumb.jpg",i]
                                 };
        
        [self.imageDataArray addObject:imgDic];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *imgDic = _imageDataArray[indexPath.row];
    LYPictureFirstPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LYPictureFirstPageCell class]) forIndexPath:indexPath];
    cell.imageView.image = imgDic[@"image"];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(CellImageSize, CellImageSize);
    
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LYPictureFirstPageCell * cell = (LYPictureFirstPageCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    
    NSInteger index = indexPath.row;
    
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
}

#pragma mark - Setter and getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, LW_SCREENWIDTH, LW_SCREENHEIGHT - 64) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[LYPictureFirstPageCell class] forCellWithReuseIdentifier:NSStringFromClass([LYPictureFirstPageCell class])];
    }
    return _collectionView;
}

- (LWPhotoBrowserInteractiveTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LWPhotoBrowserInteractiveTransition alloc] init];
    }
    return _animatedTransition;
}

- (NSMutableArray *)pictureImageViews {
    if (!_pictureImageViews) {
        _pictureImageViews = [[NSMutableArray alloc] init];
    }
    return _pictureImageViews;
}

#pragma mark - Custom
//构造图片Frame数组
- (NSArray<NSValue *> *)firstImageViewFrames{
    
    NSMutableArray *imageFrames = [NSMutableArray new];
    for (int i = 0; i < _imageURLs.count; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        LYPictureFirstPageCell * cell = (LYPictureFirstPageCell *)[_collectionView cellForItemAtIndexPath:indexPath];
        
        if (cell.imageView) {
            //获取当前view在Window上的frame
            CGRect frame = [self getFrameInWindow:cell.imageView];
            [imageFrames addObject:[NSValue valueWithCGRect:frame]];
            
        }else{//当前不可见的cell,frame设为CGRectZero添加到数组中,防止数组越界
            CGRect frame = CGRectZero;
            [imageFrames addObject:[NSValue valueWithCGRect:frame]];
        }
    }
    
    return imageFrames;
}

//构造图片模型数组
- (NSArray<LWPhotoModel *> *)browseSouceModelItemArray{
    
    NSMutableArray *models = [NSMutableArray new];
    for (NSInteger i = 0; i < _imageURLs.count; i++) {
        NSDictionary *imageDic = _imageDataArray[i];
        NSString *url = _imageURLs[i];
        LWPhotoModel *model = [[LWPhotoModel alloc] init];
        model.image_url = url;
        model.image_thumb_url = imageDic[@"imgUrl_thumb"];
        model.image = imageDic[@"image"];
        [models addObject:model];
    }
    return models;
}
// 获取指定视图在window中的位置
- (CGRect)getFrameInWindow:(UIView *)view
{
    return [view.superview convertRect:view.frame toView:nil];
}

@end
