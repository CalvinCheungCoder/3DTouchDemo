//
//  MainTabBarViewController.m
//  3DTouchDemo
//
//  Created by 张丁豪 on 2017/4/19.
//  Copyright © 2017年 zhangdinghao. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface MainTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    // 创建子控制器
    [self createSubViewControllers];
    // 设置所有的、分栏元素项
    [self setTabBarItems];
}

// 创建子控制器
- (void)createSubViewControllers{
    
    OneViewController *One = [[OneViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:One];
    
    TwoViewController *Two = [[TwoViewController alloc]init];
    UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:Two];
    
    ThreeViewController *four = [[ThreeViewController alloc]init];
    UINavigationController *navi4 = [[UINavigationController alloc]initWithRootViewController:four];
    
    self.viewControllers = @[navi,navi2,navi4];
}

// 设置所有的、分栏元素项
- (void)setTabBarItems{
    
    NSArray *titleArr = @[@"首页",@"课件",@"我"];
    NSArray *normalImgArr = @[@"home",@"kejian",@"my"];
    NSArray *selectedImgArr = @[@"homeSelect",@"kejianSele",@"mySelect"];
    
    for (int i = 0; i<titleArr.count; i++)
    {
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArr[i] image:[UIImage imageNamed:normalImgArr[i]] selectedImage:[[UIImage imageNamed:selectedImgArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        vc.tabBarItem.tag = i+1;
    }
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
}

@end
