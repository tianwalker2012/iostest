//
//  EZAppDelegate.m
//  iOSTest
//
//  Created by Apple on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EZAppDelegate.h"
#import "EZDrawableView.h"

@implementation EZAppDelegate

@synthesize window = _window, child;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    EZDrawableView* myView = [[EZDrawableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    myView.backgroundColor = [UIColor yellowColor];
    // Override point for customization after application launch.
    myView.viewName = @"parent";
    [self.window addSubview:myView];
    myView.handler = self;
    
    child = [[EZDrawableView alloc] initWithFrame:CGRectMake(10, 10, 50, 400)]; 
    child.viewName = @"child";
    child.backgroundColor = [UIColor lightGrayColor];
    [myView addSubview:child];
    
    EZDrawableView* button = [[EZDrawableView alloc] initWithFrame:CGRectMake(276, 10, 44, 44)];
    button.viewName = @"button";
    button.backgroundColor = [UIColor lightGrayColor];
    button.handler = self;
    [self.window addSubview:button];
    
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"Touch began");
    UITouch* touchPoint = [touches anyObject];
    NSString* className = NSStringFromClass([touchPoint.view class]);
    NSLog(@"View Class: %@",className);
    if(![className isEqualToString:@"EZDrawableView"]){
        return;
    }
    EZDrawableView* touchedView = (EZDrawableView*)touchPoint.view;
    NSLog(@"Touch begin by Name: %@",touchedView.viewName);
    if([touchedView.viewName isEqualToString:@"parent"]){
        //NSLog(@"For sure parent get called");
        [touchedView setFrame:CGRectMake(50, 50, 100, 100)];
        [touchedView setNeedsDisplay];
        //[touchedView setNeedsLayout];
    }else{
        //NSLog(@"Parent not get called");
    }
    //NSLog(@"Touch began, touch class:%@", NSStringFromClass([[touches anyObject] class]));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touchPoint = [touches anyObject];
    NSString* className = NSStringFromClass([touchPoint.view class]);
    
    if(![className isEqualToString:@"EZDrawableView"]){
        return;
    }
    NSLog(@"Touch Moved");
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touch Ended");
    UITouch* touchPoint = [touches anyObject];
    NSString* className = NSStringFromClass([touchPoint.view class]);
    if(![className isEqualToString:@"EZDrawableView"]){
        return;
    }
    EZDrawableView* touchView = (EZDrawableView*)touchPoint.view;
    if([touchView.viewName isEqualToString:@"button"]){
        NSLog(@"Child frame is %@", NSStringFromCGRect(child.frame));
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touch Cancelled");
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
