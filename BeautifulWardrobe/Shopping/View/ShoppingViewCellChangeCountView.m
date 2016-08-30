//
//  ShoppingViewCellChangeCountView.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/30.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ShoppingViewCellChangeCountView.h"

@interface ShoppingViewCellChangeCountView ()<UITextFieldDelegate>

@end

@implementation ShoppingViewCellChangeCountView

- (instancetype)init {
    if (self = [super init]) {
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    _addBtn = [[UIButton alloc] init];
    [_addBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _addBtn.tag = 10087;
    [_addBtn setTitle:@"+" forState:UIControlStateNormal];
    _addBtn.titleLabel.font  = [UIFont systemFontOfSize:30];
    [self addSubview:_addBtn];
    _addBtn.backgroundColor = JBBlackColor;
    //typeof(ShoppingViewCellChangeCountView *)weakSelf = self;
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.offset(0);
        make.right.offset(0);
        make.width.mas_equalTo(50);
    }];
    
    _reduceBtn = [[UIButton alloc] init];
    [_reduceBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _reduceBtn.tag = 10086;
    [_reduceBtn setTitle:@"-" forState:UIControlStateNormal];
    _reduceBtn.titleLabel.font  = [UIFont systemFontOfSize:30];
    [self addSubview:_reduceBtn];
    _reduceBtn.backgroundColor = JBBlackColor;
    [_reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.bottom.offset(0);
        make.top.offset(0);
        make.width.equalTo(_addBtn.mas_width);
    }];
    
    _countTextField = [[UITextField alloc] init];
    _countTextField.delegate = self;
    _countTextField.text = @"1";
    _countTextField.textAlignment = NSTextAlignmentCenter;
    _countTextField.font = [UIFont systemFontOfSize:20];
    [self addSubview:_countTextField];
    [_countTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_reduceBtn.mas_right).offset(0);
        make.right.equalTo(_addBtn.mas_left).offset(0);
        make.top.bottom.offset(0);
        
    }];
    
}

- (void)btnClick:(UIButton *)btn {
    _totalCount = [_countTextField.text intValue];
    if (btn.tag == 10086) {
        if (_totalCount > 1) {
             _countTextField.text = [NSString stringWithFormat:@"%d",_totalCount-1];
            _totalCount--;
        }
    }else if (btn.tag == 10087) {
        if (_totalCount < 100) {
              _countTextField.text = [NSString stringWithFormat:@"%d",_totalCount+1];
            _totalCount++;
        }
    }
    if (self.btnClickCallBack) {
        self.btnClickCallBack(_totalCount);
    }
}

@end
