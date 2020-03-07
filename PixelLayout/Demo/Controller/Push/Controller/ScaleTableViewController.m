//
//  ScaleTableViewController.m
//  PixelLayout
//
//  Created by wxl on 15/3/6.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "ScaleTableViewController.h"
#import "UIColor+Extension.h"
#import "ScaleCell.h"

@interface ScaleTableViewController ()

@end

@implementation ScaleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WXLRandomColor();
    self.navigationItem.title = @"Scale";
    
    [PixelLayout setDevice:iPhone6 isPixel:point isScale:allScale];
    self.tableView.rowHeight = layout(K_CellHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ScaleCell cellWithTableView:tableView];;
}

@end
