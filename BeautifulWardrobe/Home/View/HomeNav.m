//
//  HomeNav.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/11.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "HomeNav.h"

@implementation HomeNav

NSString *titleImageName=@"weibo_image_text.png";
NSString *searchButtonTitle=@"button_category.png";

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor= JBColor(255, 83, 135);
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:titleImageName];
    [self addSubview:imgView];
    __weak typeof(self)weakSelf = self;
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    
    UIButton *joinBtn = [UIButton new];
    [joinBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    joinBtn.backgroundColor = [UIColor whiteColor];
    joinBtn.layer.cornerRadius = 5;
    joinBtn.layer.masksToBounds = YES;
    [joinBtn setTitle:@"我要加盟" forState:UIControlStateNormal];
    [joinBtn setTitleColor:JBColor(255, 83, 135) forState:UIControlStateNormal];
    joinBtn.titleLabel.textColor = JBColor(255, 83, 135);
    joinBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    CGSize btnSize = [joinBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    //[joinBtn.titleLabel sizeThatFits:<#(CGSize)#>];
    joinBtn.tag = 100086;
    [self addSubview:joinBtn];
    [joinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(5);
        make.width.offset(btnSize.width);
        make.height.offset(30);
    }];
    
    UIButton *searchBtn = [UIButton new];
    [searchBtn setBackgroundImage:[UIImage imageNamed:searchButtonTitle] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.tag = 10087;
    [self addSubview:searchBtn];
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(5);
        make.width.offset(40);
        make.height.offset(40);
    }];
    
    
}

- (void)navBtnClick:(UIButton *)btn {
    __weak typeof(self)weakSelf = self;
    if (self.btnActionCallBack) {
        if (btn.tag == 10086) {
             weakSelf.btnActionCallBack(leftBtnTag);
        }else {
             weakSelf.btnActionCallBack(rightBtnTag);
        }
    }
}


@end
