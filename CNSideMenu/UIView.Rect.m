//
//  UIView+Rect.m
//  eathome
//
//  Created by spectator Mr.Z on 16/2/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import "UIView+Rect.h"

@implementation UIView (Rect)

- (void)RectMakeCenterHorizontalIn:(UIView *)view marginTop:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat x = (view.bounds.size.width/2) - (width/2);
    
    self.frame = CGRectMake(x, top, width, height);
}

- (void)RectMakeCenterHorizontalIn:(UIView *)view marginBottom:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat x = (view.bounds.size.width/2) - (width/2);
    CGFloat y = view.bounds.size.height - bottom - height;
    
    self.frame = CGRectMake(x, y, width, height);
}

- (void)RectMakeCenterVerticalIn:(UIView *)view marginLeft:(CGFloat)left width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat y = (view.bounds.size.height/2) - (height/2);
    
    self.frame = CGRectMake(left, y, width, height);
}

- (void)RectMakeCenterVerticalIn:(UIView *)view marginRight:(CGFloat)right width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat x = view.bounds.size.width - right - width;
    CGFloat y = (view.bounds.size.height/2) - (height/2);
    
    self.frame = CGRectMake(x, y, width, height);
}

- (void)RectMakeIn:(UIView *)view marginRight:(CGFloat)right marginTop:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat x = view.bounds.size.width - right - width;
    
    self.frame = CGRectMake(x, top, width, height);
}

- (void)RectMakeIn:(UIView *)view marginLeft:(CGFloat)left marginBottom:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat y = view.bounds.size.height - bottom - height;
    
    self.frame = CGRectMake(left, y, width, height);
}

- (void)RectMakeIn:(UIView *)view marginRight:(CGFloat)right marginBottom:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat x = view.bounds.size.width - right - width;
    CGFloat y = view.bounds.size.height - bottom - height;
    
    self.frame = CGRectMake(x, y, width, height);
}
/**
 *  上下左右居中
 *
 *  @param view   <#view description#>
 *  @param width  <#width description#>
 *  @param height <#height description#>
 */
- (void)RectMakeCenterIn:(UIView *)view width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat x = (view.bounds.size.width/2) - (width/2);
    CGFloat y = (view.bounds.size.height/2) - (height/2);
    
    self.frame = CGRectMake(x, y, width, height);
}

@end
