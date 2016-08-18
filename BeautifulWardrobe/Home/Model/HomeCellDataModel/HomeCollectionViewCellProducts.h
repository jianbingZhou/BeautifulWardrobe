//
//  HomeCollectionViewCellProducts.h
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeCollectionViewCellSupplier, HomeCollectionViewCellBrand, HomeCollectionViewCellMerchant;

@interface HomeCollectionViewCellProducts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *taobaoPromoPrice;
@property (nonatomic, strong) NSString *taobaoSellingPrice;
@property (nonatomic, assign) double integral;
@property (nonatomic, assign) double qualityScore;
@property (nonatomic, strong) NSString *lotteryId;
@property (nonatomic, strong) NSString *fromLogoUrl;
@property (nonatomic, strong) NSString *fromTitle;
@property (nonatomic, strong) HomeCollectionViewCellSupplier *supplier;
@property (nonatomic, strong) NSString *tagType;
@property (nonatomic, strong) NSString *tagUrl;
@property (nonatomic, strong) NSString *sharesCount;
@property (nonatomic, assign) double visitsCount;
@property (nonatomic, assign) double synthesisScore;
@property (nonatomic, strong) HomeCollectionViewCellBrand *brand;
@property (nonatomic, strong) NSArray *taobaoItemImgs;
@property (nonatomic, assign) double conformScore;
@property (nonatomic, assign) double priceScore;
@property (nonatomic, strong) NSString *lastLotteryId;
@property (nonatomic, strong) NSString *commentsCount;
@property (nonatomic, strong) NSString *fromType;
@property (nonatomic, strong) NSString *taobaoUrl;
@property (nonatomic, strong) NSString *taobaoPicUrl;
@property (nonatomic, strong) NSString *taobaoSubtitle;
@property (nonatomic, assign) double taobaoVolume;
@property (nonatomic, assign) BOOL isDelist;
@property (nonatomic, strong) NSString *taobaoDelistTime;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) HomeCollectionViewCellMerchant *merchant;
@property (nonatomic, strong) NSString *taobaoPrice;
@property (nonatomic, strong) NSString *taobaoTitle;
@property (nonatomic, strong) NSString *moneySymbol;
@property (nonatomic, strong) NSString *mobileCpsUrl;
@property (nonatomic, strong) NSString *taobaoNumIid;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) NSString *pcCpsUrl;
@property (nonatomic, strong) NSString *discount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
