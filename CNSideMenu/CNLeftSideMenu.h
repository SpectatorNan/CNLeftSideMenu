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
- (void)menu:(CNLeftSideMenu *)menu didSelectMenuRowAtIndexPath:(NSIndexPath *)indexPath;
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
