//
//  DateBaseModelCollectionGoods.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/18.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateBaseModelCollectionGoods : NSObject
@property (nonatomic,assign) int goodsId;
@property (nonatomic,copy) NSString *taobao_title;
@property (nonatomic,copy) NSString *taobao_pic_url;
@property (nonatomic,assign) int taobao_num_iid;
@property (nonatomic,copy) NSString *date;
@end
