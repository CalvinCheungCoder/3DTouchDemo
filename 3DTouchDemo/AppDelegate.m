//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by 张丁豪 on 2017/4/19.
//  Copyright © 2017年 zhangdinghao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"个人中心" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    
    UIApplicationShortcutItem * itemTwo = [[UIApplicationShortcutItem alloc]initWithType:@"three" localizedTitle:@"查看课件" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"kejian@2x.png"] userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item, itemTwo];
    
    
    /* - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
    
    也需要进行一下判断，在launchOptions中有UIApplicationLaunchOptionsShortcutItemKey这样一个键，通过它，我们可以区别是否是从标签进入的app，如果是则处理结束逻辑后，返回NO，防止处理逻辑被反复回调。*/
    
    if (launchOptions[@"UIApplicationLaunchOptionsShortcutItemKey"] == nil) {
        
        NSLog(@"Yes");
        
        self.window.rootViewController = [MainTabBarViewController new];
        return YES;
        
    } else {
        
        NSLog(@"No");
        return NO;
    }
}


- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    
    
    NSLog(@"shortcutItem == %@",shortcutItem);
    
    // 根据我们设置的唯一标识判断
    if([shortcutItem.type isEqualToString:@"one"]){
        
        MainTabBarViewController *tabbar = [MainTabBarViewController new];
        tabbar.selectedIndex = 1;
        self.window.rootViewController = tabbar;
        
    }
    // 根据我们设置的 title 判断
    if ([shortcutItem.localizedTitle isEqual: @"个人中心"]) {
        
        MainTabBarViewController *tabbar = [MainTabBarViewController new];
        tabbar.selectedIndex = 2;
        self.window.rootViewController = tabbar;
        
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
