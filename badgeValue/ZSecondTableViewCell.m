//
//  ZSecondTableViewCell.m
//  badgeValue
//
//  Created by doubin on 15/7/6.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZSecondTableViewCell.h"

@interface ZSecondTableViewCell ()

@property (nonatomic, weak) UIImageView *imageV;

@end

@implementation ZSecondTableViewCell

+ (instancetype)cellWithTableview:(UITableView *)tableview
{
    static NSString *identifier = @"second";
    
    ZSecondTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ZSecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // 设置自己的背景颜色
        self.backgroundColor = [UIColor whiteColor];
        
        // 初始化操作, 创建所有将来有可能用到的子控件, 进行一次性的设置
        [self setupImageV];
    }
    return self;
}

/**
 *  初始化顶部视图
 */
- (void)setupImageV
{
    // 1.创建顶部容器
    UIImageView *imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:imageV];
    self.imageV = imageV;
}


- (void)setContentImage:(UIImage *)contentImage
{
    _contentImage = contentImage;
    
    self.imageV.image = _contentImage;
    self.imageV.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
}

@end
