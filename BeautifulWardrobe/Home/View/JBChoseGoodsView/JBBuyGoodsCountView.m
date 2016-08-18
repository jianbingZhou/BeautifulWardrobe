//
//  JBBuyGoodsCountView.m
//  CoreTextDemo
//
//  Created by Terra MacBook on 16/8/2.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBBuyGoodsCountView.h"

@implementation JBBuyGoodsCountView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
        self.leftLabel.text = @"购买数量";
        self.leftLabel.textColor = [UIColor blackColor];
        self.leftLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.leftLabel];
        
        self.addBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        self.addBtn.frame = CGRectMake(self.frame.size.width-10-40, 10,40, 30);
        [self.addBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        
        [self.addBtn setTitleColor:[UIColor blackColor] forState:0];
        self.addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.addBtn setTitle:@"+" forState:0];
        [self addSubview:self.addBtn];
        
        self.goodsCountTextf = [[UITextField alloc] initWithFrame:CGRectMake(self.addBtn.frame.origin.x -45, 10, 40, 30)];
        self.goodsCountTextf.text = @"1";
        self.goodsCountTextf.textAlignment = NSTextAlignmentCenter;
        self.goodsCountTextf.font = [UIFont systemFontOfSize:15];
        self.goodsCountTextf.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        [self addSubview:self.goodsCountTextf];
        
        self.reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.reduceBtn.frame = CGRectMake(self.goodsCountTextf.frame.origin.x -45, 10, 40, 30);
        [self.reduceBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        [self.reduceBtn setTitleColor:[UIColor blackColor] forState:0];
        self.reduceBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.reduceBtn setTitle:@"-" forState:0];
        [self addSubview:self.reduceBtn];
        
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
    return self;
}


@end
