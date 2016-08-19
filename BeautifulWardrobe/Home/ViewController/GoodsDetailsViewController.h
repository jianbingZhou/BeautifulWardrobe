//
//  GoodsDetailsViewController.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/15.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBViewController.h"
@class GoodsDetailsbodyViewDataModel;
@interface GoodsDetailsViewController : JBViewController

@property (nonatomic,copy) NSString *taobao_num_iid;
@property (nonatomic,strong) GoodsDetailsbodyViewDataModel *dataModel;

@end
