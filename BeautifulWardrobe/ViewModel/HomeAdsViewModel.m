//
//  HomeAdsViewModel.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/12.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "HomeAdsViewModel.h"
#import "DataModels.h"
@implementation HomeAdsViewModel

- (void)RequestAdsData {
   [JBNetWorkingRequst NetGetRequestWithUrl:kHomeAdvertisingURL WithParameters:nil WithSuccess:^(id value) {
      
       [self getSuccessValue:value];
       
   } WithError:^(id error) {
       [self getErrorValue:error];
   }];
}

- (void)getSuccessValue:(NSDictionary *)value {
    HomeAdsModel *homeAdsModel = [HomeAdsModel modelObjectWithDictionary:value];
    if (self.successCallBack) {
        self.successCallBack(homeAdsModel);
    }
}


- (void)getErrorValue:(id)value {
    self.errorCallBack(value);
}

@end
