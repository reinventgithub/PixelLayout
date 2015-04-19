//
//  WXLDemoTableViewController.m
//  WXLAutolayout
//
//  Created by wxl on 15/3/8.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLDemoTableViewController.h"
#import "WXLAutolayout.h"
#import "WXLScaleTableViewController.h"
#import "WXLNotScaleTableViewController.h"

@implementation WXLDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [WXLAutolayout setDevice:iPhone6 isPixel:point isScale:allScale];
    self.tableView.rowHeight = layout(K_CellHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (0 == (int)indexPath.row) {
        cell.textLabel.text = @"iPhone6 Point iPadScaleWithFont";
    } else if (1 == (int)indexPath.row)
    {
        cell.textLabel.text = @"iPhone6 Point NotScale";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == (int)indexPath.row) {
        WXLScaleTableViewController *scaleTVC = [[WXLScaleTableViewController alloc] init];
        [self.navigationController pushViewController:scaleTVC animated:YES];
    } else if (1 == (int)indexPath.row)
    {
        WXLNotScaleTableViewController *notScaleTVC = [[WXLNotScaleTableViewController alloc] init];
        [self.navigationController pushViewController:notScaleTVC animated:YES];
    }
}

@end
