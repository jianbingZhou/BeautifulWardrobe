//
//  JBChoseView.m
//  CoreTextDemo
//
//  Created by Terra MacBook on 16/8/2.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBChoseGoodsView.h"
#import "JBBuyGoodsCountView.h"

@interface JBChoseGoodsView ()<UITextFieldDelegate>

@end

@implementation JBChoseGoodsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    //毛玻璃
    self.alphaiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
    self.alphaiView.backgroundColor = [UIColor blackColor];
    self.alphaiView.alpha = 0.2;
    [self addSubview:self.alphaiView];
    //装载商品信息的视图
    self.goodsMessageView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, kWIDTH, kHEIGHT - 200)];
    self.goodsMessageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.goodsMessageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.goodsMessageView addGestureRecognizer:tap];

    //商品图片
    self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, - 20, 100, 100)];
    self.goodsImageView.image = [UIImage imageNamed:@"1.jpg"];
    self.goodsImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.goodsImageView.layer.borderWidth = 5;
    self.goodsImageView.layer.cornerRadius = 4;
    [self.goodsMessageView addSubview:self.goodsImageView];
    
    self.cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWIDTH - 40, 10, 30, 30)];
    [self.cancelBtn setBackgroundImage:[UIImage imageNamed:@"close@3x"] forState:UIControlStateNormal];
    [self.goodsMessageView addSubview:self.cancelBtn];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.goodsImageView.frame) + 20, 10, kWIDTH - CGRectGetMaxX(self.goodsImageView.frame) - 20 - 40, 20)];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    self.priceLabel.textColor = [UIColor redColor];
    self.priceLabel.text = @"商品价格";
    [self.goodsMessageView addSubview:self.priceLabel];
    
    self.stockLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.priceLabel.frame.origin.x, self.priceLabel.frame.origin.y + self.priceLabel.frame.size.height,self.priceLabel.frame.size.width, 20)];
    
    self.stockLabel.font = [UIFont systemFontOfSize:14];
    self.stockLabel.textColor = [UIColor blackColor];
    [self.goodsMessageView addSubview:self.stockLabel];
    
    self.choseGoodsdetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.stockLabel.frame.origin.x, CGRectGetMaxY(self.stockLabel.frame), self.stockLabel.frame.size.width, 40)];
    self.choseGoodsdetailLabel.numberOfLines = 2;
    self.choseGoodsdetailLabel.font = [UIFont systemFontOfSize:14];
    [self.goodsMessageView addSubview:self.choseGoodsdetailLabel];
    
    //分界线
    self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.goodsImageView.frame.origin.y+self.goodsImageView.frame.size.height+20, kWIDTH, 0.5)];
    self.lineLabel.backgroundColor = [UIColor lightGrayColor];
    [self.goodsMessageView addSubview:self.lineLabel];
    
    //确定按钮
    self.sureBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureBtn.frame = CGRectMake(0, self.goodsMessageView.frame.size.height-50,self.goodsMessageView.frame.size.width, 50);
    [self.sureBtn setBackgroundColor:[UIColor redColor]];
    [self.sureBtn setTitleColor:[UIColor whiteColor] forState:0];
    self.sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.sureBtn setTitle:@"确定" forState:0];
    [self.goodsMessageView addSubview:self.sureBtn];

    //有的商品尺码和颜色分类特别多 所以用UIScrollView 分类过多显示不全的时候可滑动查看
    self.mainGoodsMessageView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.lineLabel.frame), kWIDTH, self.sureBtn.frame.origin.y-(self.lineLabel.frame.origin.y+self.lineLabel.frame.size.height))];
    self.mainGoodsMessageView.backgroundColor = [UIColor whiteColor];
    self.mainGoodsMessageView.showsHorizontalScrollIndicator = NO;
    self.mainGoodsMessageView.showsVerticalScrollIndicator = NO;
    [self.goodsMessageView addSubview:self.mainGoodsMessageView];

    self.jbBuyGoodsCountView = [[JBBuyGoodsCountView alloc] initWithFrame:CGRectMake(0, 100, kWIDTH, 50)];
    [self.jbBuyGoodsCountView.reduceBtn addTarget:self action:@selector(reduceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.jbBuyGoodsCountView.addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.jbBuyGoodsCountView.goodsCountTextf.delegate = self;
    [self.mainGoodsMessageView addSubview:self.jbBuyGoodsCountView];
    
}

- (void)addBtnClick {
    int count =[self.jbBuyGoodsCountView.goodsCountTextf.text intValue];
    
    if (count < self.stock) {
        self.jbBuyGoodsCountView.goodsCountTextf.text = [NSString stringWithFormat:@"%d",count+1];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
    }

}

- (void)reduceBtnClick {
    int count =[self.jbBuyGoodsCountView.goodsCountTextf.text intValue];
    if (count > 1) {
        self.jbBuyGoodsCountView.goodsCountTextf.text = [NSString stringWithFormat:@"%d",count-1];
    }else
    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        alert.tag = 100;
//        [alert show];
    }

}

#pragma mark-tfdelegste
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.mainGoodsMessageView.contentOffset = CGPointMake(0, self.jbBuyGoodsCountView.frame.origin.y);
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    int count =[self.jbBuyGoodsCountView.goodsCountTextf.text intValue];
    if (count > self.stock) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
        self.jbBuyGoodsCountView.goodsCountTextf.text = [NSString stringWithFormat:@"%d",self.stock];
        [self tap];
    }
}
-(void)tap
{
    self.mainGoodsMessageView.contentOffset = CGPointMake(0, 0);
    [self.jbBuyGoodsCountView.goodsCountTextf resignFirstResponder];
}

@end
