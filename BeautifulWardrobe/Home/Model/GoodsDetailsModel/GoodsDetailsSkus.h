//
//  GoodsDetailsSkus.h
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsSkus : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *taobaoTitle;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *moneySymbol;
@property (nonatomic, strong) NSString *quantity;
@property (nonatomic, strong) NSString *taobaoPrice;
@property (nonatomic, strong) NSString *sizeKey;
@property (nonatomic, strong) NSString *taobaoSellingPrice;
@property (nonatomic, strong) NSString *skuId;
@property (nonatomic, strong) NSString *styleKey;
@property (nonatomic, strong) NSString *taobaoPicUrl;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *isUseCoupon;
@property (nonatomic, assign) double integral;
@property (nonatomic, strong) NSString *taobaoNumIid;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
