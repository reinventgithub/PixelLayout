//
//  DemoTableViewController.m
//  PixelLayout
//
//  Created by wxl on 15/3/8.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "DemoTableViewController.h"
#import "PixelLayout.h"
#import "ScaleTableViewController.h"
#import "NotScaleTableViewController.h"
#import "PLAllScaleWithFontViewController.h"

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PixelLayout setDevice:iPhone6 isPixel:point isScale:allScale];
    self.tableView.rowHeight = layout(K_CellHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (0 == (int)indexPath.row) {
        cell.textLabel.text = @"iPhone6 Point iPadScaleWithFont";
    }
    else if (1 == (int)indexPath.row) {
        cell.textLabel.text = @"iPhone6 Point NotScale";
    }
    else if (2 == (int)indexPath.row)  {
        cell.textLabel.text = @"iPhone5 Pixel AllScaleWithFont";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == (int)indexPath.row) {
        ScaleTableViewController *scaleTVC = [[ScaleTableViewController alloc] init];
        [self.navigationController pushViewController:scaleTVC animated:YES];
    }
    else if (1 == (int)indexPath.row) {
        NotScaleTableViewController *notScaleTVC = [[NotScaleTableViewController alloc] init];
        [self.navigationController pushViewController:notScaleTVC animated:YES];
    }
    else if (2 == (int)indexPath.row) {
        PLAllScaleWithFontViewController *allScaleWithFontVC = [[PLAllScaleWithFontViewController alloc] init];
        allScaleWithFontVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:allScaleWithFontVC animated:YES];
    }
}

@end
