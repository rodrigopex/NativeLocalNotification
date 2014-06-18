//
//  AppDelegate.m
//  Test
//
//  Created by Rodrigo José Sarmento Peixoto on 18/06/14.
//  Copyright (c) 2014 truvano. All rights reserved.
//

#import "AppDelegate.h"
#include <QDebug>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    Q_UNUSED(application)
    Q_UNUSED(launchOptions)
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    Q_UNUSED(application)
    qDebug() << "APPLICATION OUTPUT: " << __FUNCTION__;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    Q_UNUSED(application)
    qDebug() << "APPLICATION OUTPUT: " << __FUNCTION__;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    Q_UNUSED(application)
    qDebug() << "APPLICATION OUTPUT: " << __FUNCTION__;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    Q_UNUSED(application)
    qDebug() << "APPLICATION OUTPUT: " << __FUNCTION__;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    Q_UNUSED(application)
    qDebug() << "APPLICATION OUTPUT: " << __FUNCTION__;
}

@end
