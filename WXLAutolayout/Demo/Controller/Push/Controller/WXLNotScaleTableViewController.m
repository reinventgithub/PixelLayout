//
//  WXLNotScaleTableViewController.m
//  WXLAutolayout
//
//  Created by wxl on 15/3/6.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLNotScaleTableViewController.h"
#import "UIColor+Extension.h"
#import "WXLNotScaleCell.h"

@interface WXLNotScaleTableViewController ()

@end

@implementation WXLNotScaleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WXLRandomColor();
    self.navigationItem.title = @"Not Scale";
    
    [WXLAutolayout setDevice:iPhone6 isPixel:point isScale:notScale];
    self.tableView.rowHeight = layout(K_CellHeight);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [WXLNotScaleCell cellWithTableView:tableView];
}

@end
