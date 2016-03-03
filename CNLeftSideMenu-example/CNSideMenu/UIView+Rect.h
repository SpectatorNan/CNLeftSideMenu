//
//  UIView+Rect.h
//  eathome
//
//  Created by spectator Mr.Z on 16/2/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rect)

/**
 *  设置Y，水平居中
 */
- (void)RectMakeCenterHorizontalIn:(UIView*)view marginTop:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;


/**
 *  设置底部间距，水平居中
 */
- (void)RectMakeCenterHorizontalIn:(UIView*)view marginBottom:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
/**
 *  设置右间距 垂直居中
 */
- (void)RectMakeCenterVerticalIn:(UIView*)view marginRight:(CGFloat)right width:(CGFloat)width height:(CGFloat)height;

/**
 *  设置X 垂直居中
 */
- (void)RectMakeCenterVerticalIn:(UIView*)view marginLeft:(CGFloat)left width:(CGFloat)width height:(CGFloat)height;

/**
 *  设置右间距，Y值
 */
- (void)RectMakeIn:(UIView*)view marginRight:(CGFloat)right marginTop:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;

/**
 *  设置左间距，底间距
 */
- (void)RectMakeIn:(UIView*)view marginLeft:(CGFloat)left marginBottom:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;

/**
 *  设置右间距，底间距
 */
- (void)RectMakeIn:(UIView*)view marginRight:(CGFloat)right marginBottom:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;

/**
 *  上下左右居中
 */
- (void)RectMakeCenterIn:(UIView*)view width:(CGFloat)width height:(CGFloat)height;
@end
