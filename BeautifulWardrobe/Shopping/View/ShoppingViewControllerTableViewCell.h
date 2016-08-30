//
//  ShoppingViewControllerTableViewCell.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/30.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataBaseModelCollectionGoods;
@class ShoppingViewCellChangeCountView;
@interface ShoppingViewControllerTableViewCell : UITableViewCell
@property (nonatomic,strong) UIButton *selectBtn;
@property (nonatomic,strong) UIImageView *goodsImages;
@property (nonatomic,strong) UILabel *goodsTitleLabel;
@property (nonatomic,strong) UILabel *sellPriceLabel;
@property (nonatomic,strong) UILabel *soldOutLabel;
@property (nonatomic,assign) float cellTotalPrice;
@property (nonatomic,assign) BOOL isSelected;
@property (nonatomic,strong) DataBaseModelCollectionGoods *dataBaseModelCollectionGoods;
@property (nonatomic,strong) ShoppingViewCellChangeCountView *shoppingChangeCountView;

@end
