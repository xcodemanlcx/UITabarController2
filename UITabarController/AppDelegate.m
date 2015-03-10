//
//  AppDelegate.m
//  UITabarController
//
//  Created by hx_leichunxiang on 14-11-24.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  内容：系统UITabBarController
//  属性：UITabBarController每个视图控制器有个UITabBarItem管理型属性，决定其在tabbar上的显示视图。

#import "AppDelegate.h"
#import "MainViewController.h"
#import "HiddenTabBarViewController.h"
#import "Item1ViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>
{
    UIViewController *_vc;
    UITabBarController *tabbarVC;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1 最简单系统的tabbar控制器的创建。
    
    NSArray *viewControllers = [self getVCArray];
    
    tabbarVC = [[UITabBarController alloc] init];
    [tabbarVC setViewControllers:viewControllers animated:YES];
    
    MainViewController *customTabBarVC = [[MainViewController alloc] init];
    [customTabBarVC setViewControllers:viewControllers];
    
    self.window.rootViewController = customTabBarVC;
    
    return YES;
}

#pragma mark - 1 最简单系统的tabbar控制器的创建。

- (NSArray *)getVCArray{
    UIViewController *v1 = [[UIViewController alloc] init];
    v1.title = @"新闻";
    v1.view.backgroundColor = [UIColor redColor];
    
    //1 UITabBarItem的创建：系统自带、标题、图片
    //a 图片使用大小30*30px，视网膜屏幕60*60.
    //b 图片颜色：淡灰色或半透明效果，选中时系统默认填充颜色（蓝色）
    
    v1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:30];
    v1.tabBarItem.badgeValue = @"99+";
    
    v1 = [[Item1ViewController alloc] init];
    
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:v1];
    nav1.title = @"新闻0";
    v1.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(toNextVC)];
    _vc = v1;
    
    UIViewController *v2 = [[UIViewController alloc] init];
    v2.title = @"设置";
    v2.view.backgroundColor = [UIColor blueColor];
    v2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@"icon_praise_s"] selectedImage:[UIImage imageNamed:nil]];
    v2.tabBarItem.badgeValue = @"1000000000000";//tabBar右上角边缘小标，
    [UIApplication sharedApplication].applicationIconBadgeNumber = 8;//应用app小标

    v2 = [[Item1ViewController alloc] init];

    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:v2];
    nav2.title = @"新闻1";
    v2.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(toNextVC)];

    
    UIViewController *v3 = [[UIViewController alloc] init];
    v3.title = @"更多";
    v3.view.backgroundColor = [UIColor purpleColor];
    v3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"2" image:[UIImage imageNamed:@"icon_praise_n"] selectedImage:[UIImage imageNamed:nil]];


    
    UIViewController *v4 = [[UIViewController alloc] init];
    v4.title = @"红包";
    v4.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *v5 = [[UIViewController alloc] init];
    v5.title = @"高清电影";
    v5.view.backgroundColor = [UIColor grayColor];
    
    UIViewController *v6 = [[UIViewController alloc] init];
    v6.title = @"娱乐";
    v6.view.backgroundColor = [UIColor grayColor];

    UIViewController *v7 = [[UIViewController alloc] init];
    v7.title = @"头条";
    v7.view.backgroundColor = [UIColor grayColor];
    
    //2 超过5个，tabbar有个more
    return @[nav1,nav2,v3,v4,v5];
}

- (void)toNextVC{
//    _vc.hidesBottomBarWhenPushed = YES;
    [_vc.navigationController pushViewController:[[HiddenTabBarViewController alloc] init] animated:YES];
}

#pragma mark - 2 UITabBarController代理

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"将要切换时");
    return YES;//允许切换视图控制器
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"已经切换 到当前试图控制器");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [UIApplication sharedApplication].applicationIconBadgeNumber = 8;//应用app小标

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
