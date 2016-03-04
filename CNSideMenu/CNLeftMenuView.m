//
//  CNLeftMenu.m
//  CNLeftSideMenu-example
//
//  Created by spectator Mr.Z on 16/2/28.
//  Copyright © 2016年 spectator Mr.Z. All rights reserved.
//

#import "CNLeftMenuView.h"
#import "CNLeftMenuCell.h"
#import "CNMenuData.h"



@interface CNLeftMenuView ()<UITableViewDataSource, UITableViewDelegate>
{ 
    UIColor *SelectColor;
    UIColor *unSelectColor;
    
    BOOL showLine;
}
@property (nonatomic, strong) NSIndexPath *menuIndexPath;

@property (nonatomic,assign) CGFloat  width;

@end



@implementation CNLeftMenuView




+ (instancetype)createMenuViewWithStyle:(CNLeftMenuStyle)menuStyle frame:(CGRect)frame{
    
    CNLeftMenuView *menu = [[CNLeftMenuView alloc] initWithFrame:frame];
    
    [menu createMenuViewWithStyle:menuStyle];
    
    return menu;
}

- (instancetype)createMenuViewWithStyle:(CNLeftMenuStyle)menuStyle {
    
    
    
    self.menuStyle = menuStyle;
    

    self.width = self.bounds.size.width;

    
    UITableView *leftMenu = [[UITableView alloc] initWithFrame:self.bounds];
    leftMenu.dataSource = self;
    leftMenu.delegate = self;
    leftMenu.bounces = NO;


    leftMenu.backgroundColor = [UIColor whiteColor];
    if (self.menuDatas.count > 0 ){
        [leftMenu selectRowAtIndexPath:self.menuIndexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
    }
    [self addSubview:leftMenu];

    return self;
}

- (void)implementationDelegateAndDataSource {
    

    if ([self.delegate respondsToSelector:@selector(colorOfSelectTextInMenuView)]) {
        SelectColor = [self.delegate colorOfSelectTextInMenuView];
    }
    

    if ([self.delegate respondsToSelector:@selector(colorOfUnSelectTextInMenuView)]) {
        unSelectColor = [self.delegate colorOfUnSelectTextInMenuView];
    }
    
    self.menuIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    if ([self.delegate respondsToSelector:@selector(rowOfDefaultSelected)]) {
        self.menuIndexPath = [self.delegate rowOfDefaultSelected];
    }
    
     showLine = NO;
    if ([self.delegate respondsToSelector:@selector(isShowUnderline)]) {
        showLine = [self.delegate isShowUnderline];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    NSInteger number = [self.dataSource numberOfRowInMenuView:self];

    NSAssert(number > 0, @"the menu count is zero, please check menu data");

    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    CNLeftMenuCell *cell;
    CNMenuData *data = self.menuDatas[indexPath.row];
    if (self.menuStyle == CNLeftMenuStyleImageAndText) {
        cell = [CNLeftMenuCell ShowImageAndTextInMenuView:tableView withWidth:self.width];
        
        if (indexPath == self.menuIndexPath) {
            cell.titleL.textColor = SelectColor;
            cell.titleImgV.image = data.onImg;
        } else {
            cell.titleL.textColor = unSelectColor;
            cell.titleImgV.image = data.offImg;
            
        }
        cell.titleL.text = data.title;
    } else if (self.menuStyle == CNLeftMenuStyleOnlyImage) {
        cell = [CNLeftMenuCell ShowImageInMenuView:tableView withWidth:self.width];
        if (indexPath == self.menuIndexPath) {

            cell.titleImgV.image = data.onImg;
        } else {

            cell.titleImgV.image = data.offImg;
            
        }
    } else if (self.menuStyle == CNLeftMenuStyleOnlyText) {
        
        cell = [CNLeftMenuCell ShowTextInMenuView:tableView withWidth:self.width];
        cell.titleL.text = data.title;
        if (indexPath == self.menuIndexPath) {
            cell.titleL.textColor = SelectColor;
            
        } else {
            cell.titleL.textColor = unSelectColor;
            
        }
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    

    if (!showLine) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, cell.bounds.size.height-1, [UIScreen mainScreen].bounds.size.width, 1)];
        [cell.contentView addSubview:line];
    }
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
    cell.userInteractionEnabled = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CNMenuData *newData = self.menuDatas[indexPath.row];
    CNMenuData *oldData = self.menuDatas[self.menuIndexPath.row];
    if (self.menuStyle == CNLeftMenuStyleImageAndText) {
    if (indexPath != self.menuIndexPath) {
        CNLeftMenuCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.titleL.textColor = SelectColor;
        newCell.titleImgV.image = newData.onImg;
        
        CNLeftMenuCell *oldCell = [tableView cellForRowAtIndexPath: self.menuIndexPath];
        oldCell.titleL.textColor = unSelectColor;
        oldCell.titleImgV.image = oldData.offImg;
        
        self.menuIndexPath = indexPath;
    }
    } else if (self.menuStyle == CNLeftMenuStyleOnlyImage) {
        if (indexPath != self.menuIndexPath) {
            CNLeftMenuCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
            
            newCell.titleImgV.image = newData.onImg;
            
            CNLeftMenuCell *oldCell = [tableView cellForRowAtIndexPath: self.menuIndexPath];
           
            oldCell.titleImgV.image = oldData.offImg;
            
            self.menuIndexPath = indexPath;
        }
    } else if (self.menuStyle == CNLeftMenuStyleOnlyText) {
        if (indexPath != self.menuIndexPath) {
            CNLeftMenuCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
            newCell.titleL.textColor = SelectColor;
           
            
            CNLeftMenuCell *oldCell = [tableView cellForRowAtIndexPath: self.menuIndexPath];
            oldCell.titleL.textColor = unSelectColor;
            
            
            self.menuIndexPath = indexPath;
        }
    }
    
//    NSLog(@"select left menu at index: %ld with name is %@", indexPath.row, newData.title);
    if ([self.delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)]) {
        [self.delegate menu:self didSelectRowAtIndexPath:indexPath];
    }
    
}

@end
