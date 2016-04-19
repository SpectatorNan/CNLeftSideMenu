//
//  CNLeftCollectionView.m
//  CNLeftSideMenu-example
//
//  Created by spectator Mr.Z on 16/3/1.
//  Copyright © 2016年 spectator Mr.Z. All rights reserved.
//

#import "CNLeftCollectionView.h"
#import "CNContentCell.h"
#import "CNContentData.h"

@interface CNLeftCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,assign) CNCollectionStyle  cellStyle;

@property (nonatomic, strong) UIView *advertisementView;

@end

static NSString *collectCellID = @"collectCell";
static NSString *headerSectionID = @"ReusableHeaderView";

@implementation CNLeftCollectionView

+ (instancetype)createCollectionViewWithData:(NSArray*)dataArr frame:(CGRect)frame {
    
    CNLeftCollectionView *collectionView = [[CNLeftCollectionView alloc] initWithFrame:frame];
    collectionView.contentArr = dataArr;
    [collectionView createCollectionView];
    
    return collectionView;
}

- (instancetype)createCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *contentView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    [self addSubview:contentView];
    
    contentView.delegate = self;
    contentView.dataSource = self;
    contentView.backgroundColor = [UIColor clearColor];
    
    self.contentView = contentView;
    
    [contentView registerClass:[CNContentCell class] forCellWithReuseIdentifier:collectCellID];
    return self;
}

// UICollectionViewDataSource
// cell 的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    

    if (self.contentArr.count < 1) {
        NSLog(@"内容没有数据");
    }
    
    
    return self.contentArr.count;
}

// section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    

    return 1;
}

// cell 的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CNContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectCellID forIndexPath:indexPath];
    [cell sizeToFit];
    
    if (!cell) {
        NSLog(@"cannot create CNContentCell, please check CNContentCell");
    }
    

    cell.data  = self.contentArr[indexPath.row];
    [cell setDataForCell];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}



// 头部内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    

    
    if ([self.dataSource respondsToSelector:@selector(showAdvertisementView)]) {
    UICollectionReusableView *headerView = [self.dataSource showAdvertisementView];
    
    return headerView;
    } else {
        return  nil;
    }
    
}

// UICollectionViewDelegateFlowLayout
// cell 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize = CGSizeZero;
    if ([self.delegate respondsToSelector:@selector(sizeForItemAtIndexPath:)]) {
        cellSize = [self.delegate sizeForItemAtIndexPath:indexPath];
    } else {
        
        CGFloat count = 2;
        if ([self.dataSource respondsToSelector:@selector(numberOfEachRow)]) {
            count = [self.dataSource numberOfEachRow];
        }
        if (count > 3) {
            count = 3;
        }
    
    CGFloat width = (self.bounds.size.width-(10*count))/2;
    CGFloat height = width+40;
        cellSize = CGSizeMake(width, height);
    }
    return cellSize;
}

//  每个 uicollectionView 的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    UIEdgeInsets viewInset = UIEdgeInsetsZero;
    if ([self.delegate respondsToSelector:@selector(insetForSectionAtIndex:)]) {
        viewInset = [self.delegate insetForSectionAtIndex:section];
    } else {
        viewInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return viewInset;
}

// 每个 UICollectionView 纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

// UICollectionViewDelegate
// 选中回调
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didSelectedItemsAtIndexPath:)]) {
        [self.delegate didSelectedItemsAtIndexPath:indexPath];
    }
    
    
}

// 是否可以选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
@end
