//
//  CNLeftMenuCell.m
//  eathome
//
//  Created by spectator Mr.Z on 16/2/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import "CNLeftMenuCell.h"
#import "UIView+Rect.h"

@implementation CNLeftMenuCell


+ (instancetype)ShowImageAndTextInMenuView:(UITableView *)menu withWidth:(CGFloat)width{
    static NSString *cellID = @"leftMenu";
    
    CNLeftMenuCell *cell = [menu dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[CNLeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell ShowImageAndTextInMenuCell:cell withWidth: width];
    
    
    return cell;
}

- (instancetype)ShowImageAndTextInMenuCell:(CNLeftMenuCell*)cell withWidth:(CGFloat)width {
    
    
    UIImageView *titleImg = [[UIImageView alloc] init];
    [titleImg RectMakeCenterVerticalIn:cell.contentView marginLeft:5 width:width/2-5-2 height:cell.contentView.bounds.size.height-10];
    [cell.contentView addSubview:titleImg];
    self.titleImgV = titleImg;
    
    CGFloat labelX = CGRectGetMaxX(titleImg.frame)+5;
    UILabel *title = [[UILabel alloc] init];
    [title RectMakeCenterVerticalIn:cell.contentView marginLeft:labelX width:width/2-5 height:21];
    [cell.contentView addSubview: title];
    self.titleL = title;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:12];
    
    return  cell;
}

- (instancetype)ShowTextInMenuCell:(CNLeftMenuCell *)cell withWidth:(CGFloat)width {
    
    UILabel *titleL = [[UILabel alloc] init];
    
    [titleL RectMakeCenterVerticalIn:cell.contentView marginLeft:5 width:width-10 height:cell.contentView.bounds.size.height];
    titleL.textAlignment = NSTextAlignmentCenter;
    self.titleL = titleL;
    [cell.contentView addSubview:titleL];
 
    return cell;
}

- (instancetype)ShowImageInMenuCell:(CNLeftMenuCell *)cell withWidth:(CGFloat)width {
    UIImageView *menuImgV = [[UIImageView alloc] init];

    CGFloat length = MIN(width-10, cell.contentView.bounds.size.height-10);
    CGFloat left = width/2 - length/2;
    
    [menuImgV RectMakeCenterVerticalIn:cell.contentView marginLeft:left width:length height:length];
    self.titleImgV = menuImgV;
    [cell.contentView addSubview:menuImgV];
    
    return cell;
}

+ (instancetype)ShowImageInMenuView:(UITableView *)menu withWidth:(CGFloat)width {
    static NSString *cellID = @"leftMenu";
    
    CNLeftMenuCell *cell = [menu dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[CNLeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell ShowImageInMenuCell:cell withWidth:width];
    
    
    return cell;
    
}

+ (instancetype)ShowTextInMenuView:(UITableView *)menu withWidth:(CGFloat)width {
    static NSString *cellID = @"leftMenu";
    
    CNLeftMenuCell *cell = [menu dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[CNLeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell ShowTextInMenuCell:cell withWidth: width];
    
    
    return cell;
}

@end
