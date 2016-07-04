//
//  CNLeftMenu.h
//  CNLeftSideMenu-example
//
//  Created by spectator Mr.Z on 16/2/28.
//  Copyright © 2016年 spectator Mr.Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLeftMenuCell.h"

@class CNLeftMenuView;

/**
 *  菜单风格
 */
typedef NS_ENUM(NSInteger, CNLeftMenuStyle) {
    /**
     *  只显示文本
     */
    CNLeftMenuStyleOnlyText = 1,
    /**
     *  只显示图片
     */
    CNLeftMenuStyleOnlyImage,
    /**
     *  显示文本和图片
     */
    CNLeftMenuStyleImageAndText    // show Image and Text
};


@protocol CNLeftMenuDataSource <NSObject>
/**
 *  设置菜单行数
 *
 *  @param menuView 菜单视图
 *
 *  @return 菜单行数
 */
- (NSInteger)numberOfRowInMenuView:(CNLeftMenuView*)menuView;


@end


@protocol CNLeftMenuDelegate <NSObject>

@optional
/**
 *  点击菜单回调
 *
 *  @param menu      菜单视图
 *  @param indexPath 菜单的indexpath
 */
- (void)menu:(CNLeftMenuView*)menu didSelectRowAtIndexPath:(NSIndexPath*)indexPath;

/**
 *  是否显示分割线
 */
- (BOOL)isShowUnderline;

/**
 *  设置菜单文本颜色
 */
- (UIColor*)colorOfSelectTextInMenuView;
- (UIColor*)colorOfUnSelectTextInMenuView;

/**
 *  默认选中行数
 */
- (NSIndexPath*)rowOfDefaultSelected;

@end

@interface CNLeftMenuView : UIView

@property (nonatomic, weak) id<CNLeftMenuDelegate>  delegate;
@property (nonatomic, weak) id<CNLeftMenuDataSource>  dataSource;

@property (nonatomic, strong) NSIndexPath *selectedIndex;
@property (nonatomic,assign)  CNLeftMenuStyle  menuStyle;
@property (nonatomic, strong) NSArray *menuDatas;

// create meun view
//创建视图
+ (instancetype)createMenuViewWithStyle:(CNLeftMenuStyle)menuStyle frame:(CGRect)frame;


- (void)implementationDelegateAndDataSource;
@end
