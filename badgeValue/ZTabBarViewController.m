//
//  ZTabBarViewController.m
//  badgeValue
//
//  Created by doubin on 15/7/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZTabBarViewController.h"
#import "ZFirstTableViewController.h"
#import "ZSecondTableViewController.h"

@interface ZTabBarViewController () <UITabBarControllerDelegate>

@property (nonatomic, assign) long index;

@end

@implementation ZTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    
    [self addOneChildVcClass:[ZFirstTableViewController class] title:@"First" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    [self addOneChildVcClass:[ZSecondTableViewController class] title:@"Second" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
}

- (void)addOneChildVcClass:(Class)vcClass title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    UIViewController *vc = [[vcClass alloc] init];
    vc.title = title;
    [vc.tabBarItem setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName :[UIColor orangeColor]
                                            } forState:UIControlStateSelected];
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:vc]];
    vc.navigationController.tabBarItem.badgeValue = @"3";
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex == self.index)
    {
        viewController.tabBarItem.badgeValue = nil;
        
        switch (self.selectedIndex) {
            case 0:
            {
                 ZFirstTableViewController *vc = [((UINavigationController *)viewController).viewControllers firstObject];
                [vc.tableView.header beginRefreshing];
            }
                break;
                
            case 1:
            {
                ZSecondTableViewController *vc = [((UINavigationController *)viewController).viewControllers firstObject];
                [vc.tableView.header beginRefreshing];
            }
                break;
                
            default:
                break;
        }
    }
    
    self.index = self.selectedIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
