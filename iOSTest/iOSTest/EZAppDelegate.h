//
//  EZAppDelegate.h
//  iOSTest
//
//  Created by Apple on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZDrawableView.h"

@interface EZAppDelegate : UIResponder <UIApplicationDelegate, TouchHandler>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) EZDrawableView* child;

@end
