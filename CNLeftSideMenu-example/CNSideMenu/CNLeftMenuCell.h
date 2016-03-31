//
//  CNLeftMenuCell.h
//  eathome
//
//  Created by spectator Mr.Z on 16/2/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CNLeftMenuView;
@interface CNLeftMenuCell : UITableViewCell
/**
 *  菜单图片
 */
@property (nonatomic, strong) UIImageView *titleImgV;
/**
 *  菜单文本
 */
@property (nonatomic, strong) UILabel *titleL;
/**
 *  是否显示图片
 */
@property (nonatomic,assign) BOOL  showImage;


/**
 *  显示图片和文本
 *
 */
- (instancetype)ShowImageAndTextInMenuCell:(CNLeftMenuCell*)cell withWidth:(CGFloat)width;
+ (instancetype)ShowImageAndTextInMenuView:(UITableView*)menu withWidth:(CGFloat)width;

/**
 *  显示图片
 *
 */
- (instancetype)ShowImageInMenuCell:(CNLeftMenuCell*)cell withWidth:(CGFloat)width;
+ (instancetype)ShowImageInMenuView:(UITableView*)menu withWidth:(CGFloat)width;

/**
 *  显示文本
 */
- (instancetype)ShowTextInMenuCell:(CNLeftMenuCell*)cell withWidth:(CGFloat)width;
+ (instancetype)ShowTextInMenuView:(UITableView*)menu withWidth:(CGFloat)width;
@end
