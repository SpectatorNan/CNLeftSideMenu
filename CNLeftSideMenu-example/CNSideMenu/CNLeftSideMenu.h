//
//  CNLeftSideMenu.h
//  eathome
//
//  Created by spectator Mr.Z on 16/2/25.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLeftMenuView.h"

@class CNLeftSideMenu;
@class CNLeftCollectionView;


@protocol CNLeftSideMenuDataSource <NSObject>

@end

@protocol CNLeftSideMenuDelegate <NSObject>


@optional
/**
 * Called after the user changes the row.
 * 通知你点击了菜单栏的哪一行 
 */
- (void)menu:(CNLeftSideMenu *)menu didSelectMenuRowAtIndexPath:(NSIndexPath *)indexPath;
/**
 * the default width is 0.2 of screen
 *默认宽度是屏幕宽度的0.2
  */
- (CGFloat)widthForMenuView;

/**
 *show or not show underline
 *是否显示下划线
 */
- (BOOL)isShowMenuUnderline;

/**
 *the default selectColor is red, or unSelectColor is black
 * 默认选中红色，未选中黑色
 */
- (UIColor*)colorOfMenuSelectTextInMenuView;
- (UIColor*)colorOfMenuUnSelectTextInMenuView;


- (void)collectionContentView:(CNLeftCollectionView*)collectionView didSelectContentItemAtIndexPath:(NSIndexPath*)indexPath;

@end


@interface CNLeftSideMenu : UIView

@property (nonatomic, weak) id<CNLeftSideMenuDelegate>  delegate;
@property (nonatomic, weak) id<CNLeftSideMenuDataSource>  dataSource;
/** 内容数组 */
@property (nonatomic, strong) NSArray *contents;
/** 菜单数组 */
@property (nonatomic, strong) NSArray *titles;
/** collection 刷新对象 */
@property (nonatomic, strong) UICollectionView *collectionRefreshView;

@property (nonatomic, strong) NSIndexPath *selectedMenuIndex;
/** 刷新数据 */
- (void)reloadData;
/**
 *  初始化菜单
 *
 *  @param menus     菜单数组模型
 *  @param contents  内容数组模型
 *  @param menuIndex 菜单默认选中行
 *  @param menuStyle 菜单风格
 */
- (void)createMenuWithMenusData:(NSArray *)menus contentsData:(NSArray *)contents defaultIndex:(NSIndexPath*)menuIndex andMenuViewStyle:(CNLeftMenuStyle)menuStyle;
@end
