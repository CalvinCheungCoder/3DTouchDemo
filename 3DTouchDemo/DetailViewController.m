//
//  DetailViewController.m
//  3DTouchDemo
//
//  Created by 张丁豪 on 2017/4/19.
//  Copyright © 2017年 zhangdinghao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, readonly) NSArray *previewActionItems;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.titleStr;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self getData];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    // 分享
    UIPreviewAction *itemOne = [UIPreviewAction actionWithTitle:@"点赞" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        // 实现分享
    }];
    
    // 点赞
    UIPreviewAction *itemTwo = [UIPreviewAction actionWithTitle:@"分享" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        // 实现点赞
    }];
    return @[itemOne,itemTwo];
}


- (void)getData{
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    webView.backgroundColor = [UIColor whiteColor];
    webView.opaque = NO;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"service_terms_chs.html" ofType:nil];
    NSString *htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];
    [webView loadHTMLString:htmlCont baseURL:baseURL];
    [self.view addSubview:webView];
}



@end
