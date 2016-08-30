//
//  FMDBManager.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/18.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "FMDBManager.h"

@implementation FMDBManager
+ (FMDatabase *)shareDataBase {
    static FMDatabase *dateBase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateBase = [FMDatabase databaseWithPath:[FMDBManager getFilePath]];
    });
    return dateBase;
}
+ (NSString *)getFilePath {
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/jbDataBase.sqlite"];
    JBLOG(@"数据库路径：%@",filePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        JBLOG(@"数据库文件存在");
    }else {
        BOOL createFileSuccess = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
        if (createFileSuccess) {
            JBLOG(@"创建数据库文件成功");
        }else {
            JBLOG(@"创建数据库文件失败");
            
        }
    }
    
    return filePath;
}
+ (void)createTable {
    FMDatabase *db = [FMDBManager shareDataBase];
    if ([db open]) {
        
        NSString *sqlCollectStr = @"create table if not exists CollectTable (id integer primary key autoincrement not null,taobao_title text,taobao_pic_url text,taobao_num_iid int,date text,price text,totalCount int)";
        [db executeUpdate:sqlCollectStr];
    }
    [db close];
}

#pragma mark - 收藏
#pragma mark --------插入数据
+ (void)insertCollectFromMessage:(DataBaseModelCollectionGoods *)dateBaseModelCollectionGoods
{
    BOOL isNeedInsert=YES;
    
    NSString *insertSql=[NSString stringWithFormat:@"insert into CollectTable (taobao_title,taobao_pic_url,date,taobao_num_iid,price,totalCount) values ('%@','%@','%@',%d,'%@',%d)",dateBaseModelCollectionGoods.taobao_title,dateBaseModelCollectionGoods.taobao_pic_url,dateBaseModelCollectionGoods.date,dateBaseModelCollectionGoods.taobao_num_iid,dateBaseModelCollectionGoods.price,dateBaseModelCollectionGoods.totalCount];
    
    FMDatabase *db=[FMDBManager shareDataBase];
    [db open];
    
    NSString *selectSql=[NSString stringWithFormat:@"select * from CollectTable where taobao_num_iid=%d",dateBaseModelCollectionGoods.taobao_num_iid];
    FMResultSet *set=[db executeQuery:selectSql];
    
    while ([set next]) {
        isNeedInsert=NO;
    }
    
    if (isNeedInsert) {
        
        [db executeUpdate:insertSql];
        JBLOG(@"插入收藏宝贝成功");
    }else {
        JBLOG(@"已经收藏过该商品");
    }
    
    [db close];
    
}

#pragma mark --------删除数据
+ (void)deleteWithCollect:(int)iid
{
    FMDatabase *db=[FMDBManager shareDataBase];
    [db open];
    
    NSString *selectSql = [NSString stringWithFormat:@"DELETE FROM CollectTable where taobao_num_iid = %d",iid];
    [db executeUpdate:selectSql];
    [db close];
}
#pragma mark --------判读数据存在
+ (BOOL)serchCollect:(int)iid
{
    FMDatabase *db = [FMDBManager shareDataBase];
    BOOL isExist=NO;
    
    NSString *selectSql=[NSString stringWithFormat:@"select * from CollectTable where taobao_num_iid=%d",iid];
    FMResultSet *set=[db executeQuery:selectSql];
    
    while ([set next]) {
        
        isExist=YES;
        
    }
    return isExist;
}


+ (NSArray *)getCollectData
{
    NSMutableArray *dataArray=[[NSMutableArray alloc]init];
    FMDatabase *db=[FMDBManager shareDataBase];
    [db open];
    NSString *fromTabeleStr=@"select * from CollectTable";
    FMResultSet *set=[db executeQuery:fromTabeleStr];
    while ([set next]) {
        
        DataBaseModelCollectionGoods *dateBaseModelCollectionGoods=[DataBaseModelCollectionGoods new];
        
        dateBaseModelCollectionGoods.taobao_num_iid=[set intForColumn:@"taobao_num_iid"];
        dateBaseModelCollectionGoods.taobao_pic_url=[set stringForColumn:@"taobao_pic_url"];
        dateBaseModelCollectionGoods.taobao_title=[set stringForColumn:@"taobao_title"];
        dateBaseModelCollectionGoods.date=[set stringForColumn:@"date"];
        dateBaseModelCollectionGoods.price = [set stringForColumn:@"price"];
        dateBaseModelCollectionGoods.totalCount = [set intForColumn:@"totalCount"];
        [dataArray addObject:dateBaseModelCollectionGoods];
    }
    return dataArray;
    
}

+ (NSString *)getColletCounts {
    FMDatabase *db = [FMDBManager shareDataBase];
    [db open];
    NSString *sqlString = @"select * from CollectTable";
    FMResultSet *set = [db executeQuery:sqlString];
    int num = 0;
    while ([set next]) {
        num ++;
    }
    [db close];
    return [NSString stringWithFormat:@"%d",num];
}

@end
