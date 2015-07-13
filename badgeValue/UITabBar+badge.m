//
//  UITabBar+badge.m
//  badgeValue
//
//  Created by doubin on 15/7/13.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "UITabBar+badge.h"
#define tabBarItemNum 2
#define Constant 1000

@implementation UITabBar (badge)

- (void)showBadgeWithIndex:(long )index
{
    [self hideBadgeWithIndex:index];
    
    UIView *badgeView = [[UIView alloc] init];
    badgeView.tag = index + Constant;
    badgeView.layer.cornerRadius = 8;
    badgeView.backgroundColor = [UIColor redColor];
    int itemW = self.frame.size.width / tabBarItemNum;
    badgeView.frame = CGRectMake((index + 0.7) * itemW, 3, 16, 16);
    
    [self addSubview:badgeView];
}

- (void)hideBadgeWithIndex:(long )index
{
    if ([self viewWithTag:index + Constant])
    {
        [[self viewWithTag:index + Constant] removeFromSuperview];
    }
}

@end
