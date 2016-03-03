//
//  ViewController.m
//  CNLeftSideMenu-example
//
//  Created by spectator Mr.Z on 16/2/25.
//  Copyright © 2016年 spectator Mr.Z. All rights reserved.
//

#import "ViewController.h"
#import "CNContentData.h"
#import "CNMenuData.h"
#import "CNLeftSideMenu.h"
#import "CNLeftCollectionView.h"

@interface ViewController ()<CNLeftSideMenuDelegate,CNLeftSideMenuDataSource>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSIndexPath *index;

@property (nonatomic, strong) NSArray *content1;

@property (nonatomic, strong) NSArray *content2;
@property (nonatomic, strong) NSArray *content3;

@end

@implementation ViewController

- (NSArray *)content1 {
    
    CNContentData *data = [[CNContentData alloc] init];
    data.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://e.hiphotos.baidu.com/image/h%3D200/sign=a0901680a3c27d1eba263cc42bd4adaf/b21bb051f819861842d54ba04ded2e738bd4e600.jpg"]]];
    data.desc = @"测试1测试";
    if (!_content1) {
        NSArray *arr = @[data,data];
           _content1 = [arr copy];
    }
    return _content1;
}

- (NSArray *)content2 {
    CNContentData *data = [[CNContentData alloc] init];
    data.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img5.duitang.com/uploads/item/201601/06/20160106202904_NjC8Z.jpeg"]]];
    data.desc = @"测试2测试";
    if (!_content2) {
        NSArray *arr = @[data,data,data];

        _content2 = [arr copy];
    }
    return _content2;
}

- (NSArray *)content3 {
    CNContentData *data = [[CNContentData alloc] init];
    data.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img5.duitang.com/uploads/item/201509/12/20150912085729_MwHrc.png"]]];
    data.desc = @"测试3测试";
    if (!_content3) {
        NSArray *arr = @[data];

        _content3 = [arr copy];
    }
    return _content3;
}

- (NSArray *)titles {
    if (!_titles) {
        
        CNMenuData *data1 = [CNMenuData new];
        data1.title = @"111";
        data1.offImg = [UIImage imageNamed:@"arrow_left_alt2"];
        data1.onImg = [UIImage imageNamed:@"arrow_right_alt2"];
        
        CNMenuData *data2 = [CNMenuData new];
        data2.title = @"222";
        data2.offImg = [UIImage imageNamed:@"arrow_up_alt1"];
        data2.onImg = [UIImage imageNamed:@"arrow_up_alt2"];
        
        CNMenuData *data3 = [CNMenuData new];
        data3.title = @"333";
        data3.offImg = [UIImage imageNamed:@"award_stroke_16"];
        data3.onImg = [UIImage imageNamed:@"award_fill_16"];
        
        CNMenuData *data4 = [CNMenuData new];
        data4.title = @"444";
        data4.offImg = [UIImage imageNamed:@"battery_empty_16"];
        data4.onImg = [UIImage imageNamed:@"battery_full_16"];
        
        CNMenuData *data5 = [CNMenuData new];
        data5.title = @"555";
        data5.offImg = [UIImage imageNamed:@"book_28"];
        data5.onImg = [UIImage imageNamed:@"book_alt"];
        
        CNMenuData *data6 = [CNMenuData new];
        data6.title = @"666";
        data6.offImg = [UIImage imageNamed:@"cloud_upload"];
        data6.onImg = [UIImage imageNamed:@"cloud_download"];
        
        CNMenuData *data7 = [CNMenuData new];
        data7.title = @"777";
        data7.offImg = [UIImage imageNamed:@"comment_stroke_28"];
        data7.onImg = [UIImage imageNamed:@"comment_fill_28"];
        
        
        _titles = [NSArray arrayWithObjects:data1,data2,data3,data4,data5,data6,data7, nil];
    }
    
    return _titles;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = [NSIndexPath indexPathForRow:0 inSection:0];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CNLeftSideMenu *menu = [[CNLeftSideMenu alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    menu.delegate = self;
    menu.dataSource = self;
    

    
    [menu createMenuWithMenusData:self.titles defaultIndex:self.index contentsData:self.content1];
    [self.view addSubview: menu];
    
    
}

- (void)menu:(CNLeftSideMenu *)menu didSelectMenuRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row%3 == 0) {
        
        menu.contents = self.content1;
        
        [menu reloadData];
    } else if (indexPath.row%3 == 1) {

        menu.contents = self.content2;


        [menu reloadData];
    } else if (indexPath.row%3 == 2) {

        menu.contents = self.content3;


        
        [menu reloadData];
    } else {
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
