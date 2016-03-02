//
//  CNContentCell.m
//  eathome
//
//  Created by spectator Mr.Z on 16/2/25.
//  Copyright © 2016年 test. All rights reserved.
//

#import "CNContentCell.h"

@implementation CNContentCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetWidth(self.frame)-10)];
    [self addSubview:self.imgView];
    
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.imgView.frame), CGRectGetHeight(self.frame)-CGRectGetMaxY(self.imgView.frame))];
    [self addSubview:self.descLabel];
        self.descLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}


- (void)setDataForCell {
    
    self.imgView.image = self.data.image;
    
    self.descLabel.text = self.data.desc;
}

@end
