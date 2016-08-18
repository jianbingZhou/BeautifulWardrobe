//
//  JBGoodsTypeView.h
//  CoreTextDemo
//
//  Created by Terra MacBook on 16/8/2.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^jbGoodsTypeViewCallBack)(int index);
@interface JBGoodsTypeView : UIView

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) int selectIndex;
@property (nonatomic,copy) jbGoodsTypeViewCallBack callBack;

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSrc typeName:(NSString *)name;
@end
