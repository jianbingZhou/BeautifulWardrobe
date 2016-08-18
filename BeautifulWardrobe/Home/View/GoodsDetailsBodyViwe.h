//
//  GoodsDetailsBodyViwe.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/15.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GoodsDetailsbodyViewDataModel;
@interface GoodsDetailsBodyViwe : UIView
@property (nonatomic,strong) UITableView *bgTableView;
@property (nonatomic,strong) UIView *navView;

@property (nonatomic,strong) NSArray *dataArray;
//刷新View
- (void)updateContentsWithModle:(GoodsDetailsbodyViewDataModel *)model;
@end
