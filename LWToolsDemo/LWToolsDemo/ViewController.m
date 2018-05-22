//
//  ViewController.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/8.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "ViewController.h"
#import "LWAnimationButtonDemo.h"
#import "LWViewImageController.h"
#import "LWSegmentViewController.h"
#import "LWPhotosViewController.h"
#import "LWAnimationViewController.h"
#import "LWRereshAnimationDemo.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSoure;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate  = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:_tableView];
    
    _dataSoure = @[NSStringFromClass([LWAnimationButtonDemo class]),NSStringFromClass([LWViewImageController class]),NSStringFromClass([LWSegmentViewController class]),NSStringFromClass([LWPhotosViewController class]),NSStringFromClass([LWAnimationViewController class]),NSStringFromClass([LWRereshAnimationDemo class])];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSoure.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = _dataSoure[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *nextVc = [NSClassFromString(_dataSoure[indexPath.row]) new];
    [self.navigationController pushViewController:nextVc animated:YES];
}





@end
