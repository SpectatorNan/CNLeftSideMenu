//
//  CNLeftCollectionView.h
//  CNLeftSideMenu-example
//
//  Created by spectator Mr.Z on 16/3/1.
//  Copyright © 2016年 spectator Mr.Z. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, CNCollectionStyle) {
    CNCollectionStyleOnlyImage = 1,     // only image
    CNCollectionStyleImageAndDetail,    // image and one line text
    CNCollectionStyleImageAndTwoText    // image and two line text
};

@class CNLeftCollectionView;
@class CNContentData;

@protocol CNLeftCollectionViewDataSource <NSObject>
@optional
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInContentView:(CNLeftCollectionView*)contentView;
// the default is one
- (NSInteger)numberOfEachRow;
- (UICollectionReusableView *)showAdvertisementView;
@end


@protocol CNLeftCollectionViewDelegate <NSObject>

@optional
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section;
@end

@interface CNLeftCollectionView : UIView


@property (nonatomic,assign) id<CNLeftCollectionViewDataSource>  dataSource;
@property (nonatomic,assign) id<CNLeftCollectionViewDelegate>  delegate;
//刷新对象
@property (nonatomic, strong) UICollectionView *contentView;
@property (nonatomic, strong) NSArray *contentArr;
+ (instancetype)createCollectionViewWithData:(NSArray*)dataArr frame:(CGRect)frame;


@end
