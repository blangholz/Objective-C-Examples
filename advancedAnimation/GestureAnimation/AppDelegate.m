//
//  AppDelegate.m
//  GestureAnimation
//
//  Created by Ben Langholz on 2/26/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "AppDelegate.h"
#include "easingViewController.h"
#include "scaleAndRotateViewController.h"
#include "doubleTapViewController.h"
#include "nodesViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    easingViewController *easingView = [[easingViewController alloc] init];
    UINavigationController *easingNavigationController = [[UINavigationController alloc] initWithRootViewController:easingView];
    easingNavigationController.tabBarItem.image = [UIImage imageNamed:@"..."];
    
    scaleAndRotateViewController *scaleAndRotateView = [[scaleAndRotateViewController alloc] init];
    UINavigationController *scaleAndRotateNavigationController = [[UINavigationController alloc] initWithRootViewController:scaleAndRotateView];
    scaleAndRotateView.tabBarItem.image = [UIImage imageNamed:@"..."];
    
    doubleTapViewController *doubleTapView = [[doubleTapViewController alloc] init];
    UINavigationController *doubleTapNavigationController = [[UINavigationController alloc] initWithRootViewController:doubleTapView];
    doubleTapNavigationController.tabBarItem.image = [UIImage imageNamed:@"..."];

    nodesViewController *nodeView = [[nodesViewController alloc] init];
    UINavigationController *nodeNavigationController = [[UINavigationController alloc] initWithRootViewController:nodeView];
    nodeNavigationController.tabBarItem.image = [UIImage imageNamed:@"..."];
    
    tabBarController.viewControllers = @[easingNavigationController, scaleAndRotateNavigationController, doubleTapNavigationController, nodeNavigationController];
    
    self.window.rootViewController = tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
