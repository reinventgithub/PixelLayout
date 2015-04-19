//
//  WXLScaleCell.m
//  Reader
//
//  Created by wxl on 15/1/10.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLScaleCell.h"
#import "UIColor+Extension.h"

// 定义这个宏可以使用一些更简洁的方法
#define MAS_SHORTHAND

// 定义这个宏可以使用自动装箱功能
#define MAS_SHORTHAND_GLOBALS

// 导入主头文件
#import "Masonry.h"

@implementation WXLScaleCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"bookCell";
    
    WXLScaleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[WXLScaleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self setupBookCell];
    }
    return self;
}

- (void)setupBookCell
{
    UIImageView *bookImageView = [[UIImageView alloc] init];
    bookImageView.backgroundColor = WXLRandomColor();
    [self.contentView addSubview:bookImageView];
    bookImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(layout(15));
        make.top.equalTo(layout(9.5));
        make.width.equalTo(layout(59));
        make.height.equalTo(layout(85));
    }];

    UILabel *bookNameLabel = [[UILabel alloc] init];
    bookNameLabel.backgroundColor = WXLRandomColor();
    bookNameLabel.text = @"测试测试测试测试测试测试测试测试测试测试测试";
    bookNameLabel.font = font(16);
    [self.contentView addSubview:bookNameLabel];
    bookNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(layout(94));
        make.top.equalTo(layout(11));
        make.right.equalTo(layout(0));
        make.height.equalTo(layout(27.5));
    }];

    UILabel *bookReadStatusLabel = [[UILabel alloc] init];
    bookReadStatusLabel.backgroundColor = WXLRandomColor();
    bookReadStatusLabel.text = @"测试";
    bookReadStatusLabel.font = font(16);
    [self.contentView addSubview:bookReadStatusLabel];
    bookReadStatusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bookReadStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(layout(-20));
        make.top.equalTo(layout(39.5));
        make.width.equalTo(layout(48));
        make.height.equalTo(layout(18));
    }];
}

@end
