//
//  AppDelegate.m
//  music
//
//  Created by 李兴东 on 16/5/16.
//  Copyright © 2016年 leek. All rights reserved.
//

#import "AppDelegate.h"
#import "MusicSearchViewController.h"
#import "MusicNavigationController.h"
#import "LXDEngineSDK.h"
#import "NSMutableArray+Music.h"
#import <AVFoundation/AVFoundation.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];


    //以及设置app支持接受远程控制事件代码。设置app支持接受远程控制事件，
    //其实就是在dock中可以显示应用程序图标，同时点击该图片时，打开app。
    //或者锁屏时，双击home键，屏幕上方出现应用程序播放控制按钮。
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    //    AVAudioSession *session = [AVAudioSession sharedInstance];
    //    [session setActive:YES error:nil];
    //    [session setCategory:AVAudioSessionCategoryPlayback error:nil];

    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MusicSearchViewController *vc=[[MusicSearchViewController alloc] init];
    MusicNavigationController *navVC = [[MusicNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController=navVC;
    [self.window makeKeyAndVisible];
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
