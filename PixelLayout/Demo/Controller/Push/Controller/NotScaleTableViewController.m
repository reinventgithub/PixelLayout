//
//  NotScaleTableViewController.m
//  PixelLayout
//
//  Created by wxl on 15/3/6.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "NotScaleTableViewController.h"
#import "UIColor+Extension.h"
#import "NotScaleCell.h"

@interface NotScaleTableViewController ()

@end

@implementation NotScaleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WXLRandomColor();
    self.navigationItem.title = @"Not Scale";
    
    [PixelLayout setDevice:iPhone6 isPixel:point isScale:notScale];
    self.tableView.rowHeight = layout(K_CellHeight);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NotScaleCell cellWithTableView:tableView];
}

@end
