//
//  CNContentCell.h
//  eathome
//
//  Created by spectator Mr.Z on 16/2/25.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNContentData.h"

@interface CNContentCell : UICollectionViewCell
/**
 *  内容图片
 */
@property (nonatomic, strong) UIImageView *imgView;
/**
 *  标题Label
 */
@property (nonatomic, strong) UILabel *descLabel;
/**
 *  数据模型
 */
@property (nonatomic, strong) CNContentData *data;

/**
 *  刷新数据
 */
- (void)setDataForCell;

@end
