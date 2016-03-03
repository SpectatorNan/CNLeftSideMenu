//
//  CNMenuData.h
//  eathome
//
//  Created by spectator Mr.Z on 16/2/25.
//  Copyright © 2016年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CNMenuData : NSObject
/**
 *  菜单文字
 */
@property (nonatomic, strong) NSString *title;
/**
 *  菜单选中图片
 */
@property (nonatomic, strong) UIImage *onImg;
/**
 *  菜单未选图片
 */
@property (nonatomic, strong) UIImage *offImg;

@end
