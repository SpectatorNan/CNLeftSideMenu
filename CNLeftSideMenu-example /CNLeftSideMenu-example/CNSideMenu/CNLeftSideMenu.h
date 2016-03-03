//
//  CNLeftSideMenu.h
//  eathome
//
//  Created by spectator Mr.Z on 16/2/25.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CNLeftSideMenu;
@class CNLeftCollectionView;

@protocol CNLeftSideMenuDataSource <NSObject>


@end

@protocol CNLeftSideMenuDelegate <NSObject>


@optional

// Called after the user changes the row.
// 通知你点击了菜单栏的哪一行
- (void)menu:(CNLeftSideMenu *)menu didSelectMenuRowAtIndexPath:(NSIndexPath *)indexPath;
// the default width is 0.2 of screen
// 默认宽度是屏幕宽度的0.2
- (CGFloat)widthForMenuView;
@end


@interface CNLeftSideMenu : UIView

@property (nonatomic, weak) id<CNLeftSideMenuDelegate>  delegate;
@property (nonatomic, weak) id<CNLeftSideMenuDataSource>  dataSource;
@property (nonatomic, strong) NSArray *contents;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UICollectionView *collectionRefreshView;
@property (nonatomic, strong) CNLeftCollectionView *collectionContentView;

- (void)reloadData;

- (void)createMenuWithMenusData:(NSArray *)menus defaultIndex:(NSIndexPath*)menuIndex contentsData:(NSArray *)contents;
@end
