//
//  EZDrawableView.m
//  iOSTest
//
//  Created by Apple on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EZDrawableView.h"

@implementation EZDrawableView
@synthesize handler, viewName;

- (id) initWithFrame:(CGRect)frame{
    if((self = [super initWithFrame:frame])){
        NSLog(@"The autoresize get setup, Frame is:%@",NSStringFromCGRect(frame));
        self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.handler && [self.handler respondsToSelector:@selector(touchesBegan:withEvent:)]){
        [self.handler touchesBegan:touches withEvent:event];
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.handler && [self.handler respondsToSelector:@selector(touchesMoved:withEvent:)]){
        [self.handler touchesMoved:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.handler && [self.handler respondsToSelector:@selector(touchesEnded:withEvent:)]){
        [self.handler touchesEnded:touches withEvent:event];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.handler && [self.handler respondsToSelector:@selector(touchesCancelled:withEvent:)]){
        [self.handler touchesCancelled:touches withEvent:event];
    }
}

- (void) drawRect:(CGRect)rect{
    NSLog(@"DrawRect, current Frame is:%@",NSStringFromCGRect(self.frame));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextAddRect(context, CGRectMake(5, 5, 50, 50));
    CGContextStrokePath(context);
}
@end
