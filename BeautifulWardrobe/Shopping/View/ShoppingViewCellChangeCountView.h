//
//  ShoppingViewCellChangeCountView.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/30.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeCountViewBtnClickCallBack)(int totalCount);
@interface ShoppingViewCellChangeCountView : UIView
@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UIButton *reduceBtn;
@property (nonatomic,strong) UITextField *countTextField;
@property (nonatomic,assign) int totalCount;
@property (nonatomic,copy) ChangeCountViewBtnClickCallBack btnClickCallBack;
@end
