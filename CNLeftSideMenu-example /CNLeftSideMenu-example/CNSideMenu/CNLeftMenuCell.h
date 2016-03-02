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

@property (nonatomic, strong) UIImageView *titleImgV;

@property (nonatomic, strong) UILabel *titleL;

@property (nonatomic,assign) BOOL  showImage;



- (instancetype)ShowImageAndTextInMenuCell:(CNLeftMenuCell*)cell withWidth:(CGFloat)width;
+ (instancetype)ShowImageAndTextInMenuView:(UITableView*)menu withWidth:(CGFloat)width;


- (instancetype)ShowImageInMenuCell:(CNLeftMenuCell*)cell withWidth:(CGFloat)width;
+ (instancetype)ShowImageInMenuView:(UITableView*)menu withWidth:(CGFloat)width;

- (instancetype)ShowTextInMenuCell:(CNLeftMenuCell*)cell withWidth:(CGFloat)width;
+ (instancetype)ShowTextInMenuView:(UITableView*)menu withWidth:(CGFloat)width;
@end
