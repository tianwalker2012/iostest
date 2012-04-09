//
//  EZViewController.h
//  iOSTest
//
//  Created by Apple on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZViewController : UIViewController<UITabBarDelegate>{
    IBOutlet UITabBar* tabBar;
}

@property(strong, nonatomic) UITabBar* tabBar;
@end
