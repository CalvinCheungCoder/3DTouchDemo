//
//  OneViewController.m
//  3DTouchDemo
//
//  Created by 张丁豪 on 2017/4/19.
//  Copyright © 2017年 zhangdinghao. All rights reserved.
//

#import "OneViewController.h"
#import "DetailViewController.h"

// iOS版本判断
#define s_IOS9_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )

@interface OneViewController ()<UIViewControllerPreviewingDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableView];
}

#pragma mark --
#pragma mark -- createBtn
- (void)createTableView
{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark --
#pragma mark -- TableViewDele & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
    static NSString *homeTwoCell = @"HomeOneCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeTwoCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:homeTwoCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"3D Touch";
    
    // 检测3D Touch可用性 并注册
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *webVC = [DetailViewController new];
    webVC.hidesBottomBarWhenPushed = YES;
    webVC.titleStr = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark --
#pragma mark -- peek手势
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    // 转化坐标
    location = [self.tableView convertPoint:location fromView:[previewingContext sourceView]];
    // 根据locaton获取位置
    NSIndexPath *path = [self.tableView indexPathForRowAtPoint:location];
    // 根据位置获取字典数据传传入控制器
    DetailViewController *detail = [DetailViewController new];
    detail.titleStr = [NSString stringWithFormat:@"%ld",(long)path.row];
    return detail;
    
     
//     DetailViewController *detail = [[DetailViewController alloc] init];
//     detail.preferredContentSize = CGSizeMake(0.0f,400.f);
//     CGRect rect = CGRectMake(10, [UIScreen mainScreen].bounds.size.height/2-200, self.view.frame.size.width - 20,400);
//     // 选中框的size
//     previewingContext.sourceRect = rect;
//     // 返回显示页面
//     return detail;
}

#pragma mark --
#pragma mark -- pop手势
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    viewControllerToCommit.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

@end
