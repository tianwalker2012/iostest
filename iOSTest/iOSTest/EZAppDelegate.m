//
//  EZAppDelegate.m
//  iOSTest
//
//  Created by Apple on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EZAppDelegate.h"
#import "EZDrawableView.h"
#import "EZViewController.h"
#import "EZCompleteController.h"

@implementation EZAppDelegate

@synthesize window = _window, child, tableView, tableController, myOwnView, myTableController, myHeader, wholeScreen, allInOne;

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [[[data objectAtIndex:section] objectForKey:@"rows"] count];
    return 100;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	cell.textLabel.text = [NSString stringWithFormat:@"Raw %i",[indexPath row]];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
	
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    EZDrawableView* myView = [[EZDrawableView alloc] initWithFrame:CGRectMake(0, 20, 320, 460)];
    self.myOwnView = myView;
    
    
    myView.backgroundColor = [UIColor yellowColor];
    // Override point for customization after application launch.
    myView.viewName = @"parent";
    [self.window addSubview:myView];
    myView.handler = self;
    
    
    //self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10,10,150, 400) style:UITableViewStyleGrouped];
    self.tableController = [[EZTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    NSLog(@"Completed");
    /**
    child = [[EZDrawableView alloc] initWithFrame:CGRectMake(10, 10, 50, 400)]; 
    child.viewName = @"child";
    child.backgroundColor = [UIColor lightGrayColor];
    **/
   
    NSLog(@"Add to subView");
    NSLog(@"tableView frame: %@", NSStringFromCGRect(self.tableController.tableView.frame));
    NSLog(@"Completed add to subView");
    self.tableController.tableView.delegate = self;
    self.tableController.tableView.dataSource = self;
    [myView addSubview:self.tableController.tableView];
    
    /**
    EZDrawableView* header = [[EZDrawableView alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
    header.viewName = @"header";
    header.backgroundColor = [UIColor brownColor];
    header.handler = self;
    [myView addSubview:header];
    header.alpha = 0.5;
    **/
    EZViewController* header = [[EZViewController alloc] initWithNibName:@"Header" bundle:nil];
    header.view.alpha = 0.5;
    myHeader = header;
    [myView addSubview:header.view];
    
    EZViewController* tabBar = [[EZViewController alloc] initWithNibName:@"Tabbar" bundle:nil];
    tabBar.view.alpha = 0.5;
    [myView addSubview:tabBar.view];
    
    /**
    wholeScreen = [[EZViewController alloc] initWithNibName:@"CompleteView" bundle:nil];
    wholeScreen.view.alpha =0.5;
    [myView addSubview:wholeScreen.view];
    NSLog(@"Pointer for the TabBar is %i",(int)wholeScreen.tabBar);
    **/
    allInOne = [[EZCompleteController alloc] initWithNibName:@"WholeScreen" bundle:nil];
    [myView addSubview:allInOne.view];
    
    EZDrawableView* button = [[EZDrawableView alloc] initWithFrame:CGRectMake(276, 10, 44, 44)];
    button.viewName = @"button";
    button.backgroundColor = [UIColor lightGrayColor];
    button.handler = self;
    [self.window addSubview:button];
    [button addSubview:self.tableView];
    
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
        [self.myOwnView setFrame:CGRectMake(0, 0, 200, 300)];
        NSLog(@"Child frame is %@", NSStringFromCGRect(self.tableController.tableView.frame));
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
