//
//  ViewModel.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/12.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JBRequestSuccessCallBack) (id value);
typedef void(^JBRequestErrorCallBack) (id error);

@interface ViewModelClass : NSObject
@property (nonatomic,copy) JBRequestSuccessCallBack successCallBack;
@property (nonatomic,copy) JBRequestErrorCallBack errorCallBack;

- (void)setBlockWithSuccessCallBack:(JBRequestSuccessCallBack)successCallBack
                  WithErrorCallBack:(JBRequestErrorCallBack)errorCallBack;
@end
