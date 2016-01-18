//
//  AppDelegate.m
//  BXM
//
//  Created by 宋庆亮 on 16/1/15.
//  Copyright © 2016年 宋庆亮. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 我的新闻
    NewsTableViewController *newsTVC = [[NewsTableViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:newsTVC];
    // 我的栏目
    ColumnCollectionViewController *columnTVC = [[ColumnCollectionViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:columnTVC];
    // 精选
    SelectTableViewController *selectTVC = [[SelectTableViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:selectTVC];
    // 更多
    MoveTableViewController *moveTVC = [[MoveTableViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:moveTVC];
    NSArray *array = @[nav1,nav2,nav3,nav4];
    UITabBarController *tabbar = [UITabBarController new];
    tabbar.viewControllers = array;
    self.window.rootViewController = tabbar;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
