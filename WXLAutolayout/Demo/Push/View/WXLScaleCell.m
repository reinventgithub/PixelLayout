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

#import "WXLAutolayout.h"

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

//    [WXLAutolayout setDevice:iPhone6];
    
    bookImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(9.5);
        make.width.equalTo(59);
        make.height.equalTo(85);
    }];

    UILabel *bookNameLabel = [[UILabel alloc] init];
    bookNameLabel.backgroundColor = WXLRandomColor();
    
    bookNameLabel.text = @"鱼";
    bookNameLabel.font = font(13);
    
//    NSDictionary *attrs = @{NSFontAttributeName : bookNameLabel.font};
//    CGSize size = [bookNameLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
//    
//    NSLog(@"%@", NSStringFromCGSize(size));
    
    [self.contentView addSubview:bookNameLabel];
    
    bookNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(94);
        make.top.equalTo(11);
        make.right.equalTo(0);
        make.height.equalTo(27.5);
    }];

    UILabel *bookReadStatusLabel = [[UILabel alloc] init];
    bookReadStatusLabel.backgroundColor = WXLRandomColor();
    bookReadStatusLabel.text = @"鱼羊野史";
    bookReadStatusLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:bookReadStatusLabel];
    
    bookReadStatusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bookReadStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-20);
        make.top.equalTo(39.5);
        make.width.equalTo(48);
        make.height.equalTo(18);
    }];
}

@end
