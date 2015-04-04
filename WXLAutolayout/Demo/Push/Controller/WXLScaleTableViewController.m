//
//  WXLScaleTableViewController.m
//  WXLAutolayout
//
//  Created by wxl on 15/3/6.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLScaleTableViewController.h"
#import "UIColor+Extension.h"
#import "WXLScaleCell.h"
#import "WXLAutolayout.h"

@interface WXLScaleTableViewController ()

@end

@implementation WXLScaleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WXLRandomColor();
    self.navigationItem.title = @"Scale";
    
//    [WXLAutolayout setDevice:iPhone6];
//   
//    self.tableView.rowHeight = 104*SCALE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [WXLScaleCell cellWithTableView:tableView];;
}

@end
