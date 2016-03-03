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
#import "UIColor+rgb.h"
#import "CNLeftMenuView.h"
#import "CNLeftCollectionView.h"


#define SelectColor [UIColor rgb:0x19ba89 alpha:1]
#define UnSelectColor [UIColor blackColor]



@interface CNLeftSideMenu ()<CNLeftMenuDataSource, CNLeftMenuDelegate, CNLeftCollectionViewDataSource,CNLeftCollectionViewDelegate>

@property (nonatomic, strong) UITableView *menuTable;

@property (nonatomic, strong) NSIndexPath *menuIndex;

@property (nonatomic,assign) CGFloat  menuWidth;


@end

static NSString *contentCellID = @"contentCell";
@implementation CNLeftSideMenu

- (NSInteger)numberOfRowInMenuView:(CNLeftMenuView *)menuView {
    return self.titles.count;
}



- (void)reloadData {
    
    self.collectionContentView.contentArr = self.contents;
    
    [self.collectionRefreshView reloadData];
}

- (void)createMenuWithMenusData:(NSArray *)menus defaultIndex:(NSIndexPath *)menuIndex contentsData:(NSArray *)contents {
    self.titles = menus;
    self.contents = contents;
    self.menuIndex = menuIndex;
    
    self.menuWidth = [UIScreen mainScreen].bounds.size.width*0.2;
    if ([self.delegate respondsToSelector:@selector(widthForMenuView)]) {
        self.menuWidth = [self.delegate widthForMenuView];
    }

    [self createMenuViewWithStyle:CNLeftMenuStyleImageAndText];

    
    [self createCollectionView];
}





- (void)createMenuViewWithStyle:(CNLeftMenuStyle)menuStyle {
    
    CNLeftMenuView *menuView = [CNLeftMenuView createMenuViewWithStyle:menuStyle frame:CGRectMake(0, 0, self.menuWidth, self.bounds.size.height)];

   
    menuView.dataSource = self;
    menuView.delegate = self; 
    menuView.menuDatas = self.titles;

    
    [self addSubview:menuView];
}





- (void)menu:(CNLeftMenuView*)menu didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [self.delegate menu:self didSelectMenuRowAtIndexPath:indexPath];
}


- (void)createCollectionView {
    
    
    CNLeftCollectionView *collectionView = [CNLeftCollectionView createCollectionViewWithData:self.contents frame:CGRectMake(self.menuWidth, 0, self.bounds.size.width-self.menuWidth, self.bounds.size.height)];
    [self addSubview:collectionView];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    self.collectionRefreshView = collectionView.contentView;
    self.collectionContentView = collectionView;
}





@end
