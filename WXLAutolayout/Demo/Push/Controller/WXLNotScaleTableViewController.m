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
#import "WXLAutolayout.h"

@interface WXLNotScaleTableViewController ()

@end

@implementation WXLNotScaleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WXLRandomColor();
    self.navigationItem.title = @"Not Scale";
    
    [WXLAutolayout setDevice:NOTSCALE];
   
    self.tableView.rowHeight = 104*SCALE;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [WXLNotScaleCell cellWithTableView:tableView];
}

@end
