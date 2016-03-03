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

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, strong) CNContentData *data;


- (void)setDataForCell;

@end
