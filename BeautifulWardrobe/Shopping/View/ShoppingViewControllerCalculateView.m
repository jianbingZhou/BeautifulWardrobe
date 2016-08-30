//
//  ShoppingViewControllerCalculateView.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/30.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ShoppingViewControllerCalculateView.h"

@implementation ShoppingViewControllerCalculateView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JBWhiteColor;
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    _selectedAllLabel = [[UILabel alloc] init];
    _selectedAllLabel.text = @"全选";
    _selectedAllLabel.textAlignment = NSTextAlignmentCenter;
    _selectedAllLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_selectedAllLabel];
    [_selectedAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.mas_equalTo(50);
    }];
    
    _selectedAllBtn = [[UIButton alloc] init];
    [_selectedAllBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *selectedImage = [UIImage imageNamed:@"ic_cb_checked.png"];
    UIImage *unSelectedImage = [UIImage imageNamed:@"ic_cb_disable.png"];
    [_selectedAllBtn setImage:unSelectedImage forState:UIControlStateNormal];
    [_selectedAllBtn setImage:selectedImage forState:UIControlStateSelected];
    [self addSubview:_selectedAllBtn];
    [_selectedAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(_selectedAllLabel.mas_right).offset(1);
        make.width.equalTo(@40);
    }];
    _totalPriceLabel = [[UILabel alloc] init];
    _totalPriceLabel.font = [UIFont systemFontOfSize:14];
    _totalPriceLabel.text = @"总价:";
    _totalPriceLabel.backgroundColor = JBRedColor;
    [self addSubview:_totalPriceLabel];
    [_totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_selectedAllBtn.mas_right).offset(1);
        make.top.bottom.offset(0);
        make.right.offset(0);
    }];
}

- (void)btnClick:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (self.calculateViewCallBack) {
        self.calculateViewCallBack(btn);
    }
}

@end
