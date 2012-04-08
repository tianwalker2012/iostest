//
//  EZAppDelegate.h
//  iOSTest
//
//  Created by Apple on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZDrawableView.h"
#import "EZTableViewController.h"

@class EZViewController;

@interface EZAppDelegate : UIResponder <UIApplicationDelegate, TouchHandler, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) EZDrawableView* child;
@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) UITableViewController* tableController;
@property (strong, nonatomic) EZTableViewController* myTableController;
@property (strong, nonatomic) EZDrawableView* myView;
@property (strong, nonatomic) EZViewController* myHeader;

@end
