//
//  GoodsDetailsBodyViewCellViewModel.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/15.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "GoodsDetailsBodyViewCellViewModel.h"
#import "GoodsDetailsDataModels.h"

@implementation GoodsDetailsBodyViewCellViewModel

- (void)requestGoodsDetailsViewControllerDataWithTaoBaoID:(NSString *)taoBaoID {
    NSString *url = [NSString stringWithFormat:@"%@%@",kGoodsDetailsURL,taoBaoID];
    
    
    //__weak typeof(self)weakSelf = self;
    [JBNetWorkingRequst NetGetRequestWithUrl:url WithParameters:nil WithSuccess:^(id value) {
       // __strong typeof(weakSelf) strongSelf = weakSelf;
        
        JBLOG(@"******%@",url);
        [self handleSuccessData:value];
    } WithError:^(id error) {
        
    }];
}

- (void)handleSuccessData:(id)value {
    
    
    NSDictionary *dictionary = nil;
    if ([value isKindOfClass:[NSDictionary class]]) {
       dictionary  = (NSDictionary *)value;
    }
    if (dictionary) {
        GoodsDetailsbodyViewDataModel *bodyViewDataModel = [GoodsDetailsbodyViewDataModel modelObjectWithDictionary:dictionary];
        if (self.successCallBack) {
            self.successCallBack(bodyViewDataModel);
        }

    }
}
@end
