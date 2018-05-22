//
//  LWRereshAnimationDemo.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/22.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWRereshAnimationDemo.h"
#import "LWRefreshHeader.h"
#import "LWRefreshFooter.h"

@interface LWRereshAnimationDemo ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,assign) int page;
@end

@implementation LWRereshAnimationDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadAllSubviews];
}
- (void)_loadAllSubviews {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    _page = 1;
    _dataSource = [NSMutableArray array];
    [self loadData:_page];
    
    LWRefreshHeader *header = [LWRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    header.loadingSize = 30;
    header.loadingColor = [UIColor orangeColor];
    header.style = LWAnimationViewStyleLineScale;
    _tableView.mj_header = header;
    
    LWRefreshFooter *footer = [LWRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.loadingSize = 30;
    footer.loadingColor = [UIColor orangeColor];
    footer.style = LWAnimationViewStyleLineScale;
    _tableView.mj_footer = footer;
}
- (void)refreshData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        [self.dataSource removeAllObjects];
        self.page = 1;
        [self loadData:self.page];
    });
}
- (void)loadMoreData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
        self.page++;
        [self loadData:self.page];
    });
}

- (void)loadData:(int)page {
    for (int i = 10 * (page - 1); i < 10 * page; i++) {
        [_dataSource addObject:[NSString stringWithFormat:@"这是第%d条测试数据",i]];
    }
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


@end
