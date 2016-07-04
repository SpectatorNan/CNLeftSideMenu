//
//  CNLeftSideMenu.m
//  eathome
//
//  Created by spectator Mr.Z on 16/2/25.
//  Copyright © 2016年 test. All rights reserved.
//

#import "CNLeftSideMenu.h"
#import "CNLeftMenuCell.h"
#import "CNContentCell.h"
#import "CNMenuData.h"
#import "CNContentData.h"
#import "CNLeftCollectionView.h"


#define SelectColor [UIColor rgb:0x19ba89 alpha:1]
#define UnSelectColor [UIColor blackColor]



@interface CNLeftSideMenu ()<CNLeftMenuDataSource, CNLeftMenuDelegate, CNLeftCollectionViewDataSource,CNLeftCollectionViewDelegate>

@property (nonatomic, strong) CNLeftMenuView *menuTable;

@property (nonatomic, strong) NSIndexPath *menuIndex;

@property (nonatomic,assign) CGFloat  menuWidth;

@property (nonatomic, strong) CNLeftCollectionView *collectionContentView;

@property (nonatomic, strong) UIColor *menuText_SelectColor;
@property (nonatomic, strong) UIColor *menuText_UnSelectColor;
@end

static NSString *contentCellID = @"contentCell";
@implementation CNLeftSideMenu

- (NSInteger)numberOfRowInMenuView:(CNLeftMenuView *)menuView {
    return self.titles.count;
}

- (void)setSelectedMenuIndex:(NSIndexPath *)selectedMenuIndex {
    _selectedMenuIndex = selectedMenuIndex;
    
    self.menuTable.selectedIndex = selectedMenuIndex;
}

- (void)reloadData {
    
    self.collectionContentView.contentArr = self.contents;
    
    [self.collectionRefreshView reloadData];
}

- (void)createMenuWithMenusData:(NSArray *)menus contentsData:(NSArray *)contents defaultIndex:(NSIndexPath*)menuIndex andMenuViewStyle:(CNLeftMenuStyle)menuStyle {
    self.titles = menus;
    self.contents = contents;
    self.menuIndex = menuIndex;
    
    self.menuWidth = [UIScreen mainScreen].bounds.size.width*0.2;
    if ([self.delegate respondsToSelector:@selector(widthForMenuView)]) {
        self.menuWidth = [self.delegate widthForMenuView];
    }
    self.menuText_SelectColor = [UIColor redColor];
    if ([self.delegate respondsToSelector:@selector(colorOfMenuSelectTextInMenuView)]) {
    self.menuText_SelectColor = [self.delegate colorOfMenuSelectTextInMenuView];
    }
    self.menuText_UnSelectColor = [UIColor blackColor];
    if ([self.delegate respondsToSelector:@selector(colorOfMenuUnSelectTextInMenuView)]) {
    self.menuText_UnSelectColor = [self.delegate colorOfMenuUnSelectTextInMenuView];
    }
    [self createMenuViewWithStyle:menuStyle];

    
    [self createCollectionView];
}

- (UIColor *)colorOfUnSelectTextInMenuView {
    return self.menuText_UnSelectColor;
}

- (UIColor *)colorOfSelectTextInMenuView {
    return self.menuText_SelectColor;
}

- (void)createMenuViewWithStyle:(CNLeftMenuStyle)menuStyle {
    
    CNLeftMenuView *menuView = [CNLeftMenuView createMenuViewWithStyle:menuStyle frame:CGRectMake(0, 0, self.menuWidth, self.bounds.size.height)];
    self.menuTable = menuView;
   
    menuView.dataSource = self;
    menuView.delegate = self; 
    menuView.menuDatas = self.titles;

    [menuView implementationDelegateAndDataSource];
    [self addSubview:menuView];
}

- (NSIndexPath *)rowOfDefaultSelected {
    if (self.menuIndex) {
    return self.menuIndex;
    }
    return [NSIndexPath indexPathForRow:0 inSection:0];
}



- (void)menu:(CNLeftMenuView*)menu didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    if ([self.delegate respondsToSelector:@selector(menu:didSelectMenuRowAtIndexPath:)]) {
    [self.delegate menu:self didSelectMenuRowAtIndexPath:indexPath];
    }
}


- (void)createCollectionView {
    
    
    CNLeftCollectionView *collectionView = [CNLeftCollectionView createCollectionViewWithData:self.contents frame:CGRectMake(self.menuWidth, 0, self.bounds.size.width-self.menuWidth, self.bounds.size.height)];
    [self addSubview:collectionView];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    self.collectionRefreshView = collectionView.contentView;
    self.collectionContentView = collectionView;
}


- (void)didSelectedItemsAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(collectionContentView:didSelectContentItemAtIndexPath:)]){
    [self.delegate collectionContentView:self.collectionContentView didSelectContentItemAtIndexPath:indexPath];
    }

}


@end
