//
//  ShoppingViewControllerTableViewCell.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/30.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ShoppingViewControllerTableViewCell.h"
#import "DataBaseModelCollectionGoods.h"
#import "ShoppingViewCellChangeCountView.h"

@implementation ShoppingViewControllerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUpSubViews {
    _selectBtn = [[UIButton alloc] init];
    UIImage *selectedImage = [UIImage imageNamed:@"ic_cb_checked.png"];
    UIImage *unSelectedImage = [UIImage imageNamed:@"ic_cb_disable.png"];
    [_selectBtn setImage:unSelectedImage forState:UIControlStateNormal];
    [_selectBtn setImage:selectedImage forState:UIControlStateSelected];
    [_selectBtn addTarget:self action:@selector(selectedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_selectBtn];
    
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
        make.width.mas_equalTo(selectedImage.size.width);
    }];
    
    _goodsImages = [[UIImageView alloc] init];
    _goodsImages.backgroundColor = JBRedColor;
    [self addSubview:_goodsImages];
    [_goodsImages mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_selectBtn.mas_right).offset(1);
        make.top.offset(10);
        make.bottom.offset(-10);
        make.width.mas_equalTo(80);
    }];
   
    _goodsTitleLabel = [[UILabel alloc] init];
    _goodsTitleLabel.font = [UIFont systemFontOfSize:13];
//  CGSize size =  [_goodsTitleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    _goodsTitleLabel.numberOfLines = 0;
    _goodsTitleLabel.text = @"宝贝描述";
    [self addSubview:_goodsTitleLabel];
    
    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_goodsImages.mas_right).offset(5);
        make.top.offset(0);
        make.right.offset(0);
        make.height.mas_equalTo(25);
    }];
    
    _sellPriceLabel = [[UILabel alloc] init];
    _sellPriceLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_sellPriceLabel];
    [_sellPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsTitleLabel.mas_bottom).offset(1);
        make.left.equalTo(_goodsTitleLabel.mas_left);
        make.width.equalTo(_goodsTitleLabel.mas_width);
        make.height.mas_equalTo(40);
    }];
    
    _shoppingChangeCountView = [[ShoppingViewCellChangeCountView alloc] init];
    [self addSubview:_shoppingChangeCountView];
    [_shoppingChangeCountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_goodsImages.mas_right).offset(5);
        make.top.equalTo(_sellPriceLabel.mas_bottom).offset(1);
        make.right.offset(-50);
        make.bottom.offset(0);
    }];
    
    typeof(ShoppingViewControllerTableViewCell *)weakSelf = self;
    _shoppingChangeCountView.btnClickCallBack = ^(int count){
        _cellTotalPrice= count *[_dataBaseModelCollectionGoods.price floatValue];
        
        JBLOG(@"数量：%d*****单元格价格：%f",count,weakSelf.cellTotalPrice);
    };
}

- (void)selectedBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.isSelected = !self.isSelected;
}

- (void)setDataBaseModelCollectionGoods:(DataBaseModelCollectionGoods *)dataBaseModelCollectionGoods {
    _dataBaseModelCollectionGoods = dataBaseModelCollectionGoods;
    [_goodsImages sd_setImageWithURL:[NSURL URLWithString:dataBaseModelCollectionGoods.taobao_pic_url]];
    _goodsTitleLabel.text = dataBaseModelCollectionGoods.taobao_title;
    _sellPriceLabel.text = [NSString stringWithFormat:@"单价：%@¥",dataBaseModelCollectionGoods.price];
    self.shoppingChangeCountView.countTextField.text = [NSString stringWithFormat:@"%d",dataBaseModelCollectionGoods.totalCount];
}

@end
