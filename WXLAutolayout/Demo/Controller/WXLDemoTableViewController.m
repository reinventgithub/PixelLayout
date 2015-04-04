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
    
//    [WXLAutolayout setDevice:375];
//    [WXLAutolayout setDevice:iPhone6 withPixel:pixel];
    [WXLAutolayout setDevice:iPhone6 isPixel:pixel isScale:notScale];
    self.tableView.rowHeight = scale(208);
    pixelLog(CGPointMake(1, 2));
    powerLog(px(20));
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
        cell.textLabel.text = @"Scale Autolayout";
    } else if (1 == (int)indexPath.row)
    {
        cell.textLabel.text = @"Not Scale Autolayout";
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
