//
//  JBNetWorkingRequst.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JBRequestSuccessCallBack) (id value);
typedef void(^JBRequestErrorCallBack) (id error);

@interface JBNetWorkingRequst : NSObject


//监听网络状态
+ (void)AFNetworkStatus;

//get请求
+ (void)NetGetRequestWithUrl:(NSString *)url
              WithParameters:(NSDictionary *)parameters
                 WithSuccess:(JBRequestSuccessCallBack)successCallBack
                   WithError:(JBRequestErrorCallBack)errorCallBack;

//post请求
+ (void)NetPostRequestWithUrl:(NSString *)url
               WithParameters:(NSDictionary *)parameters
                  WithSuccess:(JBRequestSuccessCallBack)successCallBak
                    WithError:(JBRequestErrorCallBack)errorCallBack;
@end
