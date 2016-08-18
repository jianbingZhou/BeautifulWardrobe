//
//  HomeNav.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/11.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,NavBtnTag) {
    leftBtnTag = 0,
    rightBtnTag
};
typedef void(^btnActionCallBack)(NSInteger NavTag);
@interface HomeNav : UIView
@property (nonatomic,copy) btnActionCallBack btnActionCallBack;
@end
