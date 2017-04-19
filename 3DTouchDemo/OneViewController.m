//
//  OneViewController.m
//  3DTouchDemo
//
//  Created by 张丁豪 on 2017/4/19.
//  Copyright © 2017年 zhangdinghao. All rights reserved.
//

#import "OneViewController.h"

// iOS版本判断
#define s_IOS9_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )

@interface OneViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // iOS 版本要大于 9 才能注册
    if (s_IOS9_OR_LATER) {
        // 判断3Dtouch是否可用
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
            // 注册
            [self registerForPreviewingWithDelegate:self sourceView:self.view];
            NSLog(@"注册 3D Touch");
        }
    }
    
    // 注册预览视图的代理和来源视图
    [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
    
    [self createBtn];
}

- (void)createBtn
{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-90, [UIScreen mainScreen].bounds.size.height/2-20, 180, 44)];
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"3D Touch" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

#pragma mark - peek手势
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    UIViewController *childVC = [[UIViewController alloc] init];
    childVC.preferredContentSize = CGSizeMake(0.0f,300.f);
    CGRect rect = CGRectMake(10, [UIScreen mainScreen].bounds.size.height/2-100, self.view.frame.size.width - 20,200);
    //此处的childVC相当于，demo中使用的页面ActionViewController
    //demo是对table中cell进行peek&pop，所以对选中cell的位置及indexPath进行计算，详情见demo
    previewingContext.sourceRect = rect;//选中框的size
    return childVC; //返回显示页面
}




#pragma mark pop手势
- (void)previewContext:(id<UIViewControllerPreviewing>)context commitViewController:(UIViewController*)vc {
    
    [self showViewController:vc sender:self];
}


@end
