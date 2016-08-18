//
//  JBChoseView.h
//  CoreTextDemo
//
//  Created by Terra MacBook on 16/8/2.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JBBuyGoodsCountView;
@class JBGoodsTypeView;
@interface JBChoseGoodsView : UIView
@property (nonatomic,strong) UIView *alphaiView;//半透明View
@property (nonatomic,strong) UIView *goodsMessageView;//放商品信息的View

@property (nonatomic,strong) UIImageView *goodsImageView;

@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *stockLabel;
@property (nonatomic,strong) UILabel *choseGoodsdetailLabel;
@property (nonatomic,strong) UILabel *lineLabel;

@property (nonatomic,strong) UIScrollView *mainGoodsMessageView;

@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,assign) int stock;

@property (nonatomic,strong) JBBuyGoodsCountView *jbBuyGoodsCountView;

@property (nonatomic,strong) JBGoodsTypeView *sizeTypeView;
@property (nonatomic,strong) JBGoodsTypeView *colorTypeView;

@end
