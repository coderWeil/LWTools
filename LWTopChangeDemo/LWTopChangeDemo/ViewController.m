//
//  ViewController.m
//  LWTopChangeDemo
//
//  Created by weil on 2018/6/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "ViewController.h"
#import "LWTopView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) LWTopView *topView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) CGFloat destHeight;
@end

@implementation ViewController
- (void)dealloc {
    [_tableView removeObserver:self forKeyPath:@"contentOffset"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self _addSubviews];
}

static CGFloat topHeight = 120.0;
- (void)_addSubviews {
    _topView = [[LWTopView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, topHeight)];
    _topView.backgroundColor = [UIColor orangeColor];
    [_topView updateTopViewWithTitle:@"这是测试标题"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.contentInset = UIEdgeInsetsMake(topHeight, 0, 0, 0);
    [self.view addSubview:_tableView];
    [self.view addSubview:_topView];
    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _destHeight = 64;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%zd行测试数据",indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0) {
            _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, topHeight);
        }else {
            CGFloat scale = (topHeight - offset.y) / topHeight;
            if (scale <= 0) {
                scale = 0;
            }
            if (scale >= 1) {
                scale = 1;
            }
            CGFloat height = topHeight - (1- scale) * (topHeight - _destHeight);
            _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
            _tableView.contentInset = UIEdgeInsetsMake(height, 0, 0, 0);
            [_topView updateTopViewWithScale:scale];
        }
    }
}

@end
