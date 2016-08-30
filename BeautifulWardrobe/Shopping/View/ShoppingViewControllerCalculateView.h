//
//  ShoppingViewControllerCalculateView.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/30.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CalculateViewCallBack)(UIButton *btn);
@interface ShoppingViewControllerCalculateView : UIView
@property (nonatomic,strong) UILabel *selectedAllLabel;
@property (nonatomic,strong) UIButton *selectedAllBtn;
@property (nonatomic,strong) UILabel *totalPriceLabel;
@property (nonatomic,strong) UIButton *settlementBtn;

@property (nonatomic,copy) CalculateViewCallBack calculateViewCallBack;
@end
