//
//  ZSecondTableViewController.m
//  badgeValue
//
//  Created by doubin on 15/7/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZSecondTableViewController.h"
#import "ZSecondTableViewCell.h"
#import "UITabBar+badge.h"

@interface ZSecondTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation ZSecondTableViewController

// 懒加载
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil)
    {
        _dataArray = [NSMutableArray arrayWithObjects:@"010", @"011", nil];
    }
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor blackColor];
    
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadOldData)];
}

- (void)loadNewData
{
    // 测试用
    self.navigationController.tabBarItem.badgeValue = nil;
    [self.navigationController.tabBarController.tabBar hideBadgeWithIndex:self.navigationController.tabBarController.selectedIndex];
    
    // 更新前面的数据结束刷新
    int newData = ((NSString *)[self.dataArray firstObject]).intValue - 1;
    
    if (newData >= 0)
    {
        NSString *newStr = [NSString stringWithFormat:@"%.3d",newData];
        [self.dataArray insertObject:newStr atIndex:0];
        [self.tableView reloadData];
    }
    else
    {
        [self addAlertVcTitle:@"我是提示" message:@"前面没有了！你不会背啊！！" actionTitle:@"擦。。"];
    }
    [self.tableView.header endRefreshing];
}

- (void)loadOldData
{
    // 测试用
    self.navigationController.tabBarItem.badgeValue = @"3";
    [self.navigationController.tabBarController.tabBar showBadgeWithIndex:self.navigationController.tabBarController.selectedIndex];
    
    // 更新后面的数据结束刷新
    int oldData = ((NSString *)[self.dataArray lastObject]).intValue + 1;
    if (oldData <= 20)
    {
        NSString *oldStr = [NSString stringWithFormat:@"%.3d",oldData];
        [self.dataArray addObject:oldStr];
        [self.tableView reloadData];
    }
    else
    {
        [self addAlertVcTitle:@"我也是提示" message:@"后面还有，但我不告诉你！😄" actionTitle:@"擦擦。。"];
    }
    
    [self.tableView.footer endRefreshing];
}

- (void)addAlertVcTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [vc dismissViewControllerAnimated:YES completion:nil];
    }];
    [vc addAction:action];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZSecondTableViewCell *cell = [ZSecondTableViewCell cellWithTableview:tableView];
    
    cell.contentImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_Cn_Fan",self.dataArray[indexPath.row]]];
    
    return cell;
}

@end
