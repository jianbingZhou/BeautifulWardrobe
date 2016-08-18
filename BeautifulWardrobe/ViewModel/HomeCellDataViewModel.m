//
//  HomeCellDataViewModel.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/12.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "HomeCellDataViewModel.h"
#import "CellDataModels.h"
#import "GoodsDetailsViewController.h"

@implementation HomeCellDataViewModel

//请求单元格数据
- (void)requestCellData {
    [JBNetWorkingRequst NetGetRequestWithUrl:kHomeCollectionViewDataURL WithParameters:nil WithSuccess:^(id value) {
        [self getSuccessDataWithValue:value];
    } WithError:^(id error) {
        
    }];
}

- (void)getSuccessDataWithValue:(NSDictionary *)value {
    HomeCollectionViewCellModel *homeCellDataModel = [HomeCollectionViewCellModel modelObjectWithDictionary:value];
    if (self.successCallBack) {
        self.successCallBack(homeCellDataModel);
    }
}

//跳转到商品详情页
- (void)pushToGoodsDetailsVcWithTaoBaoID:(NSString *)taoBaoID  WithSuperViewController:(UIViewController *)superVc {
    GoodsDetailsViewController *detailsVc = [GoodsDetailsViewController new];
    detailsVc.taobao_num_iid = taoBaoID;
    detailsVc.hidesBottomBarWhenPushed = YES;
    [superVc.navigationController pushViewController:detailsVc animated:YES];
}


@end
