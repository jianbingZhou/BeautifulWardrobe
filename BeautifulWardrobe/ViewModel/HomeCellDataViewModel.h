//
//  HomeCellDataViewModel.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/12.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ViewModelClass.h"
@interface HomeCellDataViewModel : ViewModelClass

//请求单元格数据
- (void)requestCellData;
//跳转到商品详情页
- (void)pushToGoodsDetailsVcWithTaoBaoID:(NSString *)taoBaoID  WithSuperViewController:(UIViewController *)superVc;
@end
