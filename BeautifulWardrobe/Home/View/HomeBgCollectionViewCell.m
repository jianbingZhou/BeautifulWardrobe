//
//  HomeBgCollectionViewCell.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/12.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "HomeBgCollectionViewCell.h"

@implementation HomeBgCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    UIImageView *imageView = [UIImageView new];
    [self addSubview:imageView];
    self.productImageView = imageView;
    
    UILabel *priceLabel = [UILabel new];
    priceLabel.font = [UIFont systemFontOfSize:12];
    priceLabel.textColor = [UIColor redColor];
    [self addSubview:priceLabel];
    self.priceLabel = priceLabel;
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        make.height.mas_equalTo(40);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.equalTo(priceLabel.mas_top).offset(0);
    }];
    
}

@end
