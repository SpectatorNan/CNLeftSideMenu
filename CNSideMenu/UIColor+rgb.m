//
//  UIColor+rgb.m
//  eathome
//
//  Created by spectator Mr.Z on 16/2/21.
//  Copyright © 2016年 test. All rights reserved.
//

#import "UIColor+rgb.h"

@implementation UIColor (rgb)

+ (UIColor *)rgb:(uint)rgb {
    CGFloat red = ((rgb & 0xFF0000) >> 16) / 255.0;
    CGFloat green = ((rgb & 0x00FF00) >> 8) / 255.0;
    CGFloat blue = (rgb & 0x0000FF) / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

+ (UIColor *)rgb:(uint)rgb alpha:(CGFloat)alpha {
    CGFloat red = ((rgb & 0xFF0000) >> 16) / 255.0;
    CGFloat green = ((rgb & 0x00FF00) >> 8) / 255.0;
    CGFloat blue = (rgb & 0x0000FF) / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
