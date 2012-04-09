//
//  EZCompleteController.h
//  iOSTest
//
//  Created by Apple on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZCompleteController : UINavigationController<UITabBarDelegate>{
    IBOutlet UITabBar* tabBar;
}

@property (strong, nonatomic) UITabBar* tabBar;

@end
