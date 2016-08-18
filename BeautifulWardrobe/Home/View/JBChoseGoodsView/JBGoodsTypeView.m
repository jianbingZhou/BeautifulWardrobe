//
//  JBGoodsTypeView.m
//  CoreTextDemo
//
//  Created by Terra MacBook on 16/8/2.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBGoodsTypeView.h"

@interface JBGoodsTypeView () {
    UIButton *_currentBtn;
}

@end

@implementation JBGoodsTypeView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSrc typeName:(NSString *)name {
    if (self = [super initWithFrame:frame]) {
        UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
        label.text = name;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        
        BOOL isAnewline = NO;
        float nextX = 10;
        float nextY = 40;
        for (int i  = 0;i < dataSrc.count;i ++) {
            NSString *string = dataSrc[i];
            NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
            CGSize size = [string sizeWithAttributes:dic];
            if (nextX > (self.frame.size.width - size.width - 20 - 35)) {
                isAnewline = YES;
                nextX = 10;
                nextY += 30;
            }
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(nextX, nextY, size.width+30,25);
            [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
            [btn setTitleColor:[UIColor blackColor] forState:0];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [btn setTitle:[dataSrc objectAtIndex:i] forState:0];
            btn.layer.cornerRadius = 8;
            btn.layer.borderColor = [UIColor clearColor].CGColor;
            btn.layer.borderWidth = 0;
            [btn.layer setMasksToBounds:YES];
            
            [self addSubview:btn];
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
            nextX+=size.width+35;

        }
        
        nextY += 30;
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, nextY + 11, self.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        self.height = nextY + 11;
        self.selectIndex = -1;
        _currentBtn = nil;
        _currentBtn.selected = NO;
        
    }
    return self;
}

- (void)touchbtn:(UIButton *)sender {
    if (sender.selected) {
        return;
    }
    if (!sender.selected) {
        self.selectIndex = (int)sender.tag - 100;
        
    }else {
        self.selectIndex = -1;
    }
    _currentBtn.selected= NO;
    sender.selected = !sender.selected;
    _currentBtn = sender;
    
    if (self.callBack) {
        self.callBack(self.selectIndex);
    }
}

@end
