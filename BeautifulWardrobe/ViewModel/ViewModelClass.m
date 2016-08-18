//
//  ViewModel.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/12.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ViewModelClass.h"

@implementation ViewModelClass

- (void)setBlockWithSuccessCallBack:(JBRequestSuccessCallBack)successCallBack
                  WithErrorCallBack:(JBRequestErrorCallBack)errorCallBack {
    _successCallBack = successCallBack;
    _errorCallBack = errorCallBack;
}

@end
