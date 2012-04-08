//
//  EZDrawableView.h
//  iOSTest
//
//  Created by Apple on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TouchHandler <NSObject>
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@interface EZDrawableView : UIView

@property (strong, nonatomic) id<TouchHandler> handler;
@property (strong, nonatomic) NSString* viewName;

@end

