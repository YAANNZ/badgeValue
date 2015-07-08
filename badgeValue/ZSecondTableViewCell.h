//
//  ZSecondTableViewCell.h
//  badgeValue
//
//  Created by doubin on 15/7/6.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSecondTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImage *contentImage;
+ (instancetype)cellWithTableview:(UITableView *)tableview;

@end
