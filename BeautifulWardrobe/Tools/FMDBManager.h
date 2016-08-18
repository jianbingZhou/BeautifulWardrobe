//
//  FMDBManager.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/18.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DateBaseModelCollectionGoods;
@interface FMDBManager : NSObject
+ (FMDatabase *)shareDataBase;
+ (NSString *)getFilePath;
+ (void)createTable;
+ (void)insertCollectFromMessage:(DateBaseModelCollectionGoods *)dateBaseModelCollectionGoods;
+ (void)deleteWithCollect:(int)iid;
+ (BOOL)serchCollect:(int)iid;
+ (NSArray *)getCollectData;
+ (NSString *)getColletCounts;
@end
