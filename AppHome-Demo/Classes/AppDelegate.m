//
//  AppDelegate.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <YTKNetwork/YTKNetworkConfig.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//	[self setUpNetWork];
	[self setUpWindow];
	return YES;
}

- (void)setUpNetWork {
	YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
	config.baseUrl = @"http://www.inmoe.cn/";
}

- (void)setUpWindow {
	self.window						= [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	ViewController *view			= [[ViewController alloc] init];
	UINavigationController *nav		= [[UINavigationController alloc] initWithRootViewController:view];
	self.window.rootViewController	= nav;
	[self.window makeKeyAndVisible];
}

@end
