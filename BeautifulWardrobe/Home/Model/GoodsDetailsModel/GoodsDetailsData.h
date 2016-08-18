//
//  GoodsDetailsData.h
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GoodsDetailsSupplier, GoodsDetailsBrand, GoodsDetailsMerchant, GoodsDetailsSizeTable;

@interface GoodsDetailsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *freightId;
@property (nonatomic, strong) NSArray *promos;
@property (nonatomic, strong) NSArray *service;
@property (nonatomic, strong) NSString *taobaoPromoPrice;
@property (nonatomic, strong) NSString *taobaoSellingPrice;
@property (nonatomic, assign) double integral;
@property (nonatomic, assign) double qualityScore;
@property (nonatomic, strong) NSString *isCustomCommission;
@property (nonatomic, strong) NSString *lotteryId;
@property (nonatomic, strong) NSString *fromLogoUrl;
@property (nonatomic, strong) NSString *fromTitle;
@property (nonatomic, strong) GoodsDetailsSupplier *supplier;
@property (nonatomic, strong) NSString *tagType;
@property (nonatomic, assign) id tagUrl;
@property (nonatomic, strong) NSString *sharesCount;
@property (nonatomic, assign) double visitsCount;
@property (nonatomic, assign) double synthesisScore;
@property (nonatomic, strong) GoodsDetailsBrand *brand;
@property (nonatomic, strong) NSArray *taobaoItemImgs;
@property (nonatomic, assign) double conformScore;
@property (nonatomic, assign) double priceScore;
@property (nonatomic, strong) NSString *lastLotteryId;
@property (nonatomic, strong) NSString *commentsCount;
@property (nonatomic, strong) NSString *fromType;
@property (nonatomic, strong) NSString *taobaoUrl;
@property (nonatomic, strong) NSArray *skus;
@property (nonatomic, strong) NSString *taobaoPicUrl;
@property (nonatomic, strong) NSString *taobaoSubtitle;
@property (nonatomic, assign) double taobaoVolume;
@property (nonatomic, assign) BOOL isDelist;
@property (nonatomic, strong) NSString *taobaoDelistTime;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *twoCommission;
@property (nonatomic, strong) GoodsDetailsMerchant *merchant;
@property (nonatomic, strong) NSString *lotteryShowPrizesCount;
@property (nonatomic, strong) NSString *taobaoPrice;
@property (nonatomic, strong) NSString *taobaoTitle;
@property (nonatomic, strong) NSString *moneySymbol;
@property (nonatomic, strong) NSString *mobileCpsUrl;
@property (nonatomic, strong) NSArray *propsName;
@property (nonatomic, strong) GoodsDetailsSizeTable *sizeTable;
@property (nonatomic, strong) NSString *taobaoNumIid;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, assign) BOOL isCanUseCoupon;
@property (nonatomic, strong) NSString *pcCpsUrl;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSArray *mobileDesc;
@property (nonatomic, strong) NSString *threeCommission;
@property (nonatomic, strong) NSString *oneCommission;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
