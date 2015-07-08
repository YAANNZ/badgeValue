//
//  ZFirstTableViewController.m
//  badgeValue
//
//  Created by doubin on 15/7/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZFirstTableViewController.h"

@interface ZFirstTableViewController () 

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ZFirstTableViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil)
    {
        _dataArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    }
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundColor = [UIColor blackColor];
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadOldData)];

}

- (void)loadNewData
{
    self.navigationController.tabBarItem.badgeValue = nil;
    
    NSString *newStr = [NSString stringWithFormat:@"%d",((NSString *)[self.dataArray firstObject]).intValue - 1];
    [self.dataArray insertObject:newStr atIndex:0];
    [self.tableView reloadData];
    [self.tableView.header endRefreshing];
}

- (void)loadOldData
{
    NSString *oldStr = [NSString stringWithFormat:@"%d",((NSString *)[self.dataArray lastObject]).intValue + 1];
    [self.dataArray addObject:oldStr];
    [self.tableView reloadData];
    [self.tableView.footer endRefreshing];
}

#pragma mark - Table view data source

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
    static NSString *cellID = @"first";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
   
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}




@end
