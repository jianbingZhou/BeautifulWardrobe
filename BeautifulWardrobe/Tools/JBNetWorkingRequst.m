//
//  JBNetWorkingRequst.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBNetWorkingRequst.h"

@implementation JBNetWorkingRequst

//get请求
+ (void)NetGetRequestWithUrl:(NSString *)url
              WithParameters:(NSDictionary *)parameters
                 WithSuccess:(JBRequestSuccessCallBack)successCallBack
                   WithError:(JBRequestErrorCallBack)errorCallBack {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successCallBack) {
            successCallBack(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorCallBack) {
            errorCallBack(error.localizedDescription);
        }
        
    }];
}

//post请求
+ (void)NetPostRequestWithUrl:(NSString *)url
               WithParameters:(NSDictionary *)parameters
                  WithSuccess:(JBRequestSuccessCallBack)successCallBak
                    WithError:(JBRequestErrorCallBack)errorCallBack {
    
}
//监听网络状态
+ (void)AFNetworkStatus {
    
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                JBLOG(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                JBLOG(@"无网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                JBLOG(@"蜂窝数据网");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                JBLOG(@"WiFi网络");
                
                break;
                
            default:
                break;
        }
        
    }] ;
}

@end
