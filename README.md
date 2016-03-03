## CNLeftSideMenu
* create the left side menu. the menu can scroll and custom menu's image.
* 创建一个左侧菜单。你可以自定义显示图片和文字。

## Contents
* [How To Use 【如何使用】] (#如何使用)
	
	* [CNMenuData.h](#CNMenuData.h)
	* [CNLeftSideMenu.h](#CNLeftSideMenu.h)
	
* [参考](#参考)
* [Waiting for add 【等待添加】](#等待添加)



## <a id="如何使用"></a>How To Use 【如何使用】

* 手动导入：
    * 将`CNSideMenu`文件夹中的所有文件拽入项目中
    * 导入主头文件：`#import "CNLeftSideHeader.h"`

---
## <a id="CNMenuData.h"></a>CNMenuData.h
```
@interface CNMenuData : NSObject
/**
 *  菜单文字
 */
@property (nonatomic, strong) NSString *title;
/**
 *  菜单选中图片
 */
@property (nonatomic, strong) UIImage *onImg;
/**
 *  菜单未选图片
 */
@property (nonatomic, strong) UIImage *offImg;

@end
```
### 注意

###  请使用CNMenuData 和 CNContentData 数据模型保存数据。

### 你可以通过CNContentCell 类自定义cell，自定义cell之后，请对应修改CNContentData.h模型文件。
---

## <a id="CNLeftSideMenu.h"></a>CNLeftSideMenu.h
```objective-c
@protocol CNLeftSideMenuDelegate <NSObject>


@optional

/**
 * Called after the user changes the row.
 * 通知你点击了菜单栏的哪一行 
 */
- (void)menu:(CNLeftSideMenu *)menu didSelectMenuRowAtIndexPath:(NSIndexPath *)indexPath;
/**
 * the default width is 0.2 of screen
 *默认宽度是屏幕宽度的0.2
  */
- (CGFloat)widthForMenuView;

/**
 *show or not show underline
 *是否显示下划线
 */
- (BOOL)isShowMenuUnderline;

/**
 *the default selectColor is red, or unSelectColor is black
 * 默认选中红色，未选中黑色
 */
- (UIColor*)colorOfMenuSelectTextInMenuView;
- (UIColor*)colorOfMenuUnSelectTextInMenuView;

@end


@interface CNLeftSideMenu : UIView

@property (nonatomic, weak) id<CNLeftSideMenuDelegate>  delegate;
@property (nonatomic, weak) id<CNLeftSideMenuDataSource>  dataSource;
/** 内容数组 */
@property (nonatomic, strong) NSArray *contents;
/** 菜单数组 */
@property (nonatomic, strong) NSArray *titles;
/** collection 刷新对象 */
@property (nonatomic, strong) UICollectionView *collectionRefreshView;


/** 刷新数据 */
- (void)reloadData;
/**
 *  初始化菜单
 *
 *  @param menus     菜单数组模型
 *  @param contents  内容数组模型
 *  @param menuIndex 菜单默认选中行
 *  @param menuStyle 菜单风格
 */
- (void)createMenuWithMenusData:(NSArray *)menus contentsData:(NSArray *)contents defaultIndex:(NSIndexPath*)menuIndex andMenuViewStyle:(CNLeftMenuStyle)menuStyle;

@end
```
---

## <a id="参考"></a>参考



* 菜单显示图片和文字


```objective-c
#import "CNLeftSideHeader.h"

...

CNLeftSideMenu *menu = [[CNLeftSideMenu alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    menu.delegate = self;  

    [menu createMenuWithMenusData:self.titles contentsData:self.content1 defaultIndex:self.index andMenuViewStyle:CNLeftMenuStyleImageAndText];
    [self.view addSubview: menu];

```
![](https://github.com/SpectatorNan/CNLeftSideMenu/blob/master/material/imageAndText.png)

* 菜单只显示图片

```objective-c
#import "CNLeftSideHeader.h"

...

CNLeftSideMenu *menu = [[CNLeftSideMenu alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    menu.delegate = self;  

    [menu createMenuWithMenusData:self.titles contentsData:self.content1 defaultIndex:self.index andMenuViewStyle:CNLeftMenuStyleOnlyImage];
    [self.view addSubview: menu];

```
![](https://github.com/SpectatorNan/CNLeftSideMenu/blob/master/material/image.png)

* 菜单只显示文字


```objective-c
#import "CNLeftSideHeader.h"

...

CNLeftSideMenu *menu = [[CNLeftSideMenu alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    menu.delegate = self;  

    [menu createMenuWithMenusData:self.titles contentsData:self.content1 defaultIndex:self.index andMenuViewStyle:CNLeftMenuStyleOnlyText];
    [self.view addSubview: menu];

```
![](https://github.com/SpectatorNan/CNLeftSideMenu/blob/master/material/text.png)
---

##<a id="等待添加"></a>等待添加
* 保留所有内容，以分区的形式展现
* 其他不同的视图显示内容。。。


#### ios 开发新人一枚，因公司需使用该类型的菜单，并网上大多都是抽屉效果菜单，