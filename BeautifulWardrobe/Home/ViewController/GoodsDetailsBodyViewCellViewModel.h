//
//  GoodsDetailsBodyViewCellViewModel.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/15.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ViewModelClass.h"

@interface GoodsDetailsBodyViewCellViewModel : ViewModelClass

- (void)requestGoodsDetailsViewControllerDataWithTaoBaoID:(NSString *)taoBaoID;

@end
