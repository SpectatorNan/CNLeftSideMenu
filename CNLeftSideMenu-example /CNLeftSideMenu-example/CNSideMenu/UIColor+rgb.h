//
//  UIColor+rgb.h
//  eathome
//
//  Created by spectator Mr.Z on 16/2/21.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (rgb)
/**
 *  通过十六进制返回一个颜色
 */
+ (UIColor *)rgb:(uint)rgb;
/**
 *  通过十六进制返回一个颜色
 */
+ (UIColor *)rgb:(uint)rgb alpha:(CGFloat)alpha;

@end
