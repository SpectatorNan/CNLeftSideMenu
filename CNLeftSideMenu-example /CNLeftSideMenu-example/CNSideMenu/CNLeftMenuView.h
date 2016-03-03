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


typedef NS_ENUM(NSInteger, CNLeftMenuStyle) {
    CNLeftMenuStyleOnlyText = 1,
    CNLeftMenuStyleOnlyImage,   // show Image
    CNLeftMenuStyleImageAndText    // show Image and Text
};


@protocol CNLeftMenuDataSource <NSObject>

@optional
- (NSInteger)numberOfRowInMenuView:(CNLeftMenuView*)menuView;


@end


@protocol CNLeftMenuDelegate <NSObject>

@optional
// Called after the user changes the row.
// 通知你点击了菜单栏的哪一行
- (void)menu:(CNLeftMenuView*)menu didSelectRowAtIndexPath:(NSIndexPath*)indexPath;

// show or not show underline
// 是否显示下划线
- (BOOL)isShowMenuUnderline;

// the default selectColor is red, or unSelectColor is black
// 默认选中红色，未选中黑色
- (UIColor*)colorOfSelectTextInMenuView;
- (UIColor*)colorOfUnSelectTextInMenuView;

// the default row is 0
// 默认第0行
- (NSIndexPath*)rowOfDefaultSelected;

// the default width is 0.2 of screen
// 默认宽度是屏幕宽度的0.2
- (CGFloat)widthOfMenuView;
@end

@interface CNLeftMenuView : UIView

@property (nonatomic, weak) id<CNLeftMenuDelegate>  delegate;
@property (nonatomic, weak) id<CNLeftMenuDataSource>  dataSource;


@property (nonatomic,assign)  CNLeftMenuStyle  menuStyle;
@property (nonatomic, strong) NSArray *menuDatas;

// create meun view
//创建视图
+ (instancetype)createMenuViewWithStyle:(CNLeftMenuStyle)menuStyle frame:(CGRect)frame;


- (void)implementationDelegateAndDataSource;
@end
