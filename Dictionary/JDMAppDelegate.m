//
//  JDMAppDelegate.m
//  Dictionary
//
//  Created by user10591 on 1/30/14.
//  Copyright (c) 2014 user10591. All rights reserved.
//

#import "JDMAppDelegate.h"
#import "JDMWordsModel.h"
#import "JDMWordsTableViewController.h"
#import "JDMDefinitionViewController.h"


@implementation JDMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //iniciamos el modelo
    JDMWordsModel *wordsModel = [[JDMWordsModel alloc] init];
    
    
    
    //creamos los controladores
    
    JDMWordsTableViewController *wordTVC = [[JDMWordsTableViewController alloc] initWithModel:wordsModel];
    JDMDefinitionViewController *defVC = [[JDMDefinitionViewController alloc] initWithModel:[wordsModel wordAtIndex:0 inLetterAtIndex:0]];
    
    //creamos los navigation controller
    UINavigationController *defNav = [[UINavigationController alloc] initWithRootViewController:defVC];
    UINavigationController *tablNav = [[UINavigationController alloc] initWithRootViewController:wordTVC];
    
    //creamos el splitViewController
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    
    splitVC.viewControllers = @[tablNav,defNav];
    
    
    wordTVC.delegate = defVC;
    splitVC.delegate = defVC;
    
    //asignamos controlador raiz
    
    self.window.rootViewController = splitVC;
    
    
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
