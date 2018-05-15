//
//  LWPhotoBrowserController.m
//  TransitionDemo
//
//  Created by weil on 2018/5/7.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWPhotoBrowserController.h"
#import "LWPhotoModel.h"
#import "LWPhotoViewCell.h"

#define kBrowserSpace 50.0f
@interface LWPhotoBrowserController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LWPhotoViewCellDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,assign) CGPoint transitionImageViewCenter;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation LWPhotoBrowserController
- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_imageView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, LW_SCREENWIDTH + kBrowserSpace, LW_SCREENHEIGHT) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundView = nil;
    [_collectionView registerClass:[LWPhotoViewCell class] forCellWithReuseIdentifier:NSStringFromClass([LWPhotoViewCell class])];
    [self.view addSubview:_collectionView];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_animatedTransition.photoBrowserTransition.transitionImageIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    [self prefersStatusBarHidden];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photosArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake(self.view.frame.size.width + kBrowserSpace, self.view.frame.size.height);
    return size;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LWPhotoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LWPhotoViewCell class]) forIndexPath:indexPath];
    [cell updateCellWithModel:_photosArray[indexPath.item]];
    cell.delegate = self;
    cell.index = indexPath.item;
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offset = _collectionView.contentOffset.x;
    NSInteger index = offset / (LW_SCREENWIDTH + kBrowserSpace);
    [self setupViewControllerProperty:index];
}
- (void)setupViewControllerProperty:(NSInteger)index {
    LWPhotoViewCell *cell = (LWPhotoViewCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    _animatedTransition.photoBrowserTransition.transitionImage = cell.photoZoomView.zoomImageView.image;
    _animatedTransition.photoBrowserTransition.transitionImageIndex = index;
    _imageView.frame = cell.photoZoomView.zoomImageView.frame;
    _imageView.image = cell.photoZoomView.zoomImageView.image;
    _imageView.hidden = YES;
    _transitionImageViewCenter = _imageView.center;
}
- (void)didClickImageView:(NSInteger)index {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)panAction:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:gesture.view];
    CGFloat scale = 1- (translation.y / LW_SCREENHEIGHT);
    scale = scale < 0 ? 0 : scale;
    scale = scale > 1 ? 1 : scale;
    switch (gesture.state) {
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateBegan:
        {
            [self setupViewControllerProperty:_animatedTransition.photoBrowserTransition.transitionImageIndex
             ];
            _collectionView.hidden = YES;
            _imageView.hidden = NO;
            _animatedTransition.photoBrowserTransition.panGestureRecognizer = gesture;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:
            _imageView.center = CGPointMake(_transitionImageViewCenter.x + translation.x * scale, _transitionImageViewCenter.y + translation.y);
            _imageView.transform = CGAffineTransformMakeScale(scale, scale);
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            if (scale > 0.95f) {
                [UIView animateWithDuration:0.2 animations:^{
                    self.imageView.center = self.transitionImageViewCenter;
                    self.imageView.transform = CGAffineTransformMakeScale(1, 1);
                } completion:^(BOOL finished) {
                    self.imageView.transform = CGAffineTransformIdentity;
                }];
            }
            self.animatedTransition.photoBrowserTransition.transitionImage = self.imageView.image;
            self.animatedTransition.photoBrowserTransition.currentPanGesImageFrame = self.imageView.frame;
            self.animatedTransition.photoBrowserTransition.panGestureRecognizer = nil;
        }
        default:
            break;
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
