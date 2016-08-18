//
//  GoodsDetailsData.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsData.h"
#import "GoodsDetailsService.h"
#import "GoodsDetailsSupplier.h"
#import "GoodsDetailsBrand.h"
#import "GoodsDetailsTaobaoItemImgs.h"
#import "GoodsDetailsSkus.h"
#import "GoodsDetailsMerchant.h"
#import "GoodsDetailsPropsName.h"
#import "GoodsDetailsSizeTable.h"
#import "GoodsDetailsMobileDesc.h"


NSString *const kGoodsDetailsDataFreightId = @"freight_id";
NSString *const kGoodsDetailsDataPromos = @"promos";
NSString *const kGoodsDetailsDataService = @"service";
NSString *const kGoodsDetailsDataTaobaoPromoPrice = @"taobao_promo_price";
NSString *const kGoodsDetailsDataTaobaoSellingPrice = @"taobao_selling_price";
NSString *const kGoodsDetailsDataIntegral = @"integral";
NSString *const kGoodsDetailsDataQualityScore = @"quality_score";
NSString *const kGoodsDetailsDataIsCustomCommission = @"is_custom_commission";
NSString *const kGoodsDetailsDataLotteryId = @"lottery_id";
NSString *const kGoodsDetailsDataFromLogoUrl = @"from_logo_url";
NSString *const kGoodsDetailsDataFromTitle = @"from_title";
NSString *const kGoodsDetailsDataSupplier = @"supplier";
NSString *const kGoodsDetailsDataTagType = @"tag_type";
NSString *const kGoodsDetailsDataTagUrl = @"tag_url";
NSString *const kGoodsDetailsDataSharesCount = @"shares_count";
NSString *const kGoodsDetailsDataVisitsCount = @"visits_count";
NSString *const kGoodsDetailsDataSynthesisScore = @"synthesis_score";
NSString *const kGoodsDetailsDataBrand = @"brand";
NSString *const kGoodsDetailsDataTaobaoItemImgs = @"taobao_item_imgs";
NSString *const kGoodsDetailsDataConformScore = @"conform_score";
NSString *const kGoodsDetailsDataPriceScore = @"price_score";
NSString *const kGoodsDetailsDataLastLotteryId = @"last_lottery_id";
NSString *const kGoodsDetailsDataCommentsCount = @"comments_count";
NSString *const kGoodsDetailsDataFromType = @"from_type";
NSString *const kGoodsDetailsDataTaobaoUrl = @"taobao_url";
NSString *const kGoodsDetailsDataSkus = @"skus";
NSString *const kGoodsDetailsDataTaobaoPicUrl = @"taobao_pic_url";
NSString *const kGoodsDetailsDataTaobaoSubtitle = @"taobao_subtitle";
NSString *const kGoodsDetailsDataTaobaoVolume = @"taobao_volume";
NSString *const kGoodsDetailsDataIsDelist = @"is_delist";
NSString *const kGoodsDetailsDataTaobaoDelistTime = @"taobao_delist_time";
NSString *const kGoodsDetailsDataProductId = @"product_id";
NSString *const kGoodsDetailsDataTwoCommission = @"two_commission";
NSString *const kGoodsDetailsDataMerchant = @"merchant";
NSString *const kGoodsDetailsDataLotteryShowPrizesCount = @"lottery_show_prizes_count";
NSString *const kGoodsDetailsDataTaobaoPrice = @"taobao_price";
NSString *const kGoodsDetailsDataTaobaoTitle = @"taobao_title";
NSString *const kGoodsDetailsDataMoneySymbol = @"money_symbol";
NSString *const kGoodsDetailsDataMobileCpsUrl = @"mobile_cps_url";
NSString *const kGoodsDetailsDataPropsName = @"props_name";
NSString *const kGoodsDetailsDataSizeTable = @"size_table";
NSString *const kGoodsDetailsDataTaobaoNumIid = @"taobao_num_iid";
NSString *const kGoodsDetailsDataLikesCount = @"likes_count";
NSString *const kGoodsDetailsDataIsCanUseCoupon = @"is_can_use_coupon";
NSString *const kGoodsDetailsDataPcCpsUrl = @"pc_cps_url";
NSString *const kGoodsDetailsDataDiscount = @"discount";
NSString *const kGoodsDetailsDataMobileDesc = @"mobile_desc";
NSString *const kGoodsDetailsDataThreeCommission = @"three_commission";
NSString *const kGoodsDetailsDataOneCommission = @"one_commission";


@interface GoodsDetailsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsData

@synthesize freightId = _freightId;
@synthesize promos = _promos;
@synthesize service = _service;
@synthesize taobaoPromoPrice = _taobaoPromoPrice;
@synthesize taobaoSellingPrice = _taobaoSellingPrice;
@synthesize integral = _integral;
@synthesize qualityScore = _qualityScore;
@synthesize isCustomCommission = _isCustomCommission;
@synthesize lotteryId = _lotteryId;
@synthesize fromLogoUrl = _fromLogoUrl;
@synthesize fromTitle = _fromTitle;
@synthesize supplier = _supplier;
@synthesize tagType = _tagType;
@synthesize tagUrl = _tagUrl;
@synthesize sharesCount = _sharesCount;
@synthesize visitsCount = _visitsCount;
@synthesize synthesisScore = _synthesisScore;
@synthesize brand = _brand;
@synthesize taobaoItemImgs = _taobaoItemImgs;
@synthesize conformScore = _conformScore;
@synthesize priceScore = _priceScore;
@synthesize lastLotteryId = _lastLotteryId;
@synthesize commentsCount = _commentsCount;
@synthesize fromType = _fromType;
@synthesize taobaoUrl = _taobaoUrl;
@synthesize skus = _skus;
@synthesize taobaoPicUrl = _taobaoPicUrl;
@synthesize taobaoSubtitle = _taobaoSubtitle;
@synthesize taobaoVolume = _taobaoVolume;
@synthesize isDelist = _isDelist;
@synthesize taobaoDelistTime = _taobaoDelistTime;
@synthesize productId = _productId;
@synthesize twoCommission = _twoCommission;
@synthesize merchant = _merchant;
@synthesize lotteryShowPrizesCount = _lotteryShowPrizesCount;
@synthesize taobaoPrice = _taobaoPrice;
@synthesize taobaoTitle = _taobaoTitle;
@synthesize moneySymbol = _moneySymbol;
@synthesize mobileCpsUrl = _mobileCpsUrl;
@synthesize propsName = _propsName;
@synthesize sizeTable = _sizeTable;
@synthesize taobaoNumIid = _taobaoNumIid;
@synthesize likesCount = _likesCount;
@synthesize isCanUseCoupon = _isCanUseCoupon;
@synthesize pcCpsUrl = _pcCpsUrl;
@synthesize discount = _discount;
@synthesize mobileDesc = _mobileDesc;
@synthesize threeCommission = _threeCommission;
@synthesize oneCommission = _oneCommission;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.freightId = [self objectOrNilForKey:kGoodsDetailsDataFreightId fromDictionary:dict];
            self.promos = [self objectOrNilForKey:kGoodsDetailsDataPromos fromDictionary:dict];
    NSObject *receivedGoodsDetailsService = [dict objectForKey:kGoodsDetailsDataService];
    NSMutableArray *parsedGoodsDetailsService = [NSMutableArray array];
    if ([receivedGoodsDetailsService isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGoodsDetailsService) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGoodsDetailsService addObject:[GoodsDetailsService modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGoodsDetailsService isKindOfClass:[NSDictionary class]]) {
       [parsedGoodsDetailsService addObject:[GoodsDetailsService modelObjectWithDictionary:(NSDictionary *)receivedGoodsDetailsService]];
    }

    self.service = [NSArray arrayWithArray:parsedGoodsDetailsService];
            self.taobaoPromoPrice = [self objectOrNilForKey:kGoodsDetailsDataTaobaoPromoPrice fromDictionary:dict];
            self.taobaoSellingPrice = [self objectOrNilForKey:kGoodsDetailsDataTaobaoSellingPrice fromDictionary:dict];
            self.integral = [[self objectOrNilForKey:kGoodsDetailsDataIntegral fromDictionary:dict] doubleValue];
            self.qualityScore = [[self objectOrNilForKey:kGoodsDetailsDataQualityScore fromDictionary:dict] doubleValue];
            self.isCustomCommission = [self objectOrNilForKey:kGoodsDetailsDataIsCustomCommission fromDictionary:dict];
            self.lotteryId = [self objectOrNilForKey:kGoodsDetailsDataLotteryId fromDictionary:dict];
            self.fromLogoUrl = [self objectOrNilForKey:kGoodsDetailsDataFromLogoUrl fromDictionary:dict];
            self.fromTitle = [self objectOrNilForKey:kGoodsDetailsDataFromTitle fromDictionary:dict];
            self.supplier = [GoodsDetailsSupplier modelObjectWithDictionary:[dict objectForKey:kGoodsDetailsDataSupplier]];
            self.tagType = [self objectOrNilForKey:kGoodsDetailsDataTagType fromDictionary:dict];
            self.tagUrl = [self objectOrNilForKey:kGoodsDetailsDataTagUrl fromDictionary:dict];
            self.sharesCount = [self objectOrNilForKey:kGoodsDetailsDataSharesCount fromDictionary:dict];
            self.visitsCount = [[self objectOrNilForKey:kGoodsDetailsDataVisitsCount fromDictionary:dict] doubleValue];
            self.synthesisScore = [[self objectOrNilForKey:kGoodsDetailsDataSynthesisScore fromDictionary:dict] doubleValue];
            self.brand = [GoodsDetailsBrand modelObjectWithDictionary:[dict objectForKey:kGoodsDetailsDataBrand]];
    NSObject *receivedGoodsDetailsTaobaoItemImgs = [dict objectForKey:kGoodsDetailsDataTaobaoItemImgs];
    NSMutableArray *parsedGoodsDetailsTaobaoItemImgs = [NSMutableArray array];
    if ([receivedGoodsDetailsTaobaoItemImgs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGoodsDetailsTaobaoItemImgs) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGoodsDetailsTaobaoItemImgs addObject:[GoodsDetailsTaobaoItemImgs modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGoodsDetailsTaobaoItemImgs isKindOfClass:[NSDictionary class]]) {
       [parsedGoodsDetailsTaobaoItemImgs addObject:[GoodsDetailsTaobaoItemImgs modelObjectWithDictionary:(NSDictionary *)receivedGoodsDetailsTaobaoItemImgs]];
    }

    self.taobaoItemImgs = [NSArray arrayWithArray:parsedGoodsDetailsTaobaoItemImgs];
            self.conformScore = [[self objectOrNilForKey:kGoodsDetailsDataConformScore fromDictionary:dict] doubleValue];
            self.priceScore = [[self objectOrNilForKey:kGoodsDetailsDataPriceScore fromDictionary:dict] doubleValue];
            self.lastLotteryId = [self objectOrNilForKey:kGoodsDetailsDataLastLotteryId fromDictionary:dict];
            self.commentsCount = [self objectOrNilForKey:kGoodsDetailsDataCommentsCount fromDictionary:dict];
            self.fromType = [self objectOrNilForKey:kGoodsDetailsDataFromType fromDictionary:dict];
            self.taobaoUrl = [self objectOrNilForKey:kGoodsDetailsDataTaobaoUrl fromDictionary:dict];
    NSObject *receivedGoodsDetailsSkus = [dict objectForKey:kGoodsDetailsDataSkus];
    NSMutableArray *parsedGoodsDetailsSkus = [NSMutableArray array];
    if ([receivedGoodsDetailsSkus isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGoodsDetailsSkus) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGoodsDetailsSkus addObject:[GoodsDetailsSkus modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGoodsDetailsSkus isKindOfClass:[NSDictionary class]]) {
       [parsedGoodsDetailsSkus addObject:[GoodsDetailsSkus modelObjectWithDictionary:(NSDictionary *)receivedGoodsDetailsSkus]];
    }

    self.skus = [NSArray arrayWithArray:parsedGoodsDetailsSkus];
            self.taobaoPicUrl = [self objectOrNilForKey:kGoodsDetailsDataTaobaoPicUrl fromDictionary:dict];
            self.taobaoSubtitle = [self objectOrNilForKey:kGoodsDetailsDataTaobaoSubtitle fromDictionary:dict];
            self.taobaoVolume = [[self objectOrNilForKey:kGoodsDetailsDataTaobaoVolume fromDictionary:dict] doubleValue];
            self.isDelist = [[self objectOrNilForKey:kGoodsDetailsDataIsDelist fromDictionary:dict] boolValue];
            self.taobaoDelistTime = [self objectOrNilForKey:kGoodsDetailsDataTaobaoDelistTime fromDictionary:dict];
            self.productId = [self objectOrNilForKey:kGoodsDetailsDataProductId fromDictionary:dict];
            self.twoCommission = [self objectOrNilForKey:kGoodsDetailsDataTwoCommission fromDictionary:dict];
            self.merchant = [GoodsDetailsMerchant modelObjectWithDictionary:[dict objectForKey:kGoodsDetailsDataMerchant]];
            self.lotteryShowPrizesCount = [self objectOrNilForKey:kGoodsDetailsDataLotteryShowPrizesCount fromDictionary:dict];
            self.taobaoPrice = [self objectOrNilForKey:kGoodsDetailsDataTaobaoPrice fromDictionary:dict];
            self.taobaoTitle = [self objectOrNilForKey:kGoodsDetailsDataTaobaoTitle fromDictionary:dict];
            self.moneySymbol = [self objectOrNilForKey:kGoodsDetailsDataMoneySymbol fromDictionary:dict];
            self.mobileCpsUrl = [self objectOrNilForKey:kGoodsDetailsDataMobileCpsUrl fromDictionary:dict];
    NSObject *receivedGoodsDetailsPropsName = [dict objectForKey:kGoodsDetailsDataPropsName];
    NSMutableArray *parsedGoodsDetailsPropsName = [NSMutableArray array];
    if ([receivedGoodsDetailsPropsName isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGoodsDetailsPropsName) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGoodsDetailsPropsName addObject:[GoodsDetailsPropsName modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGoodsDetailsPropsName isKindOfClass:[NSDictionary class]]) {
       [parsedGoodsDetailsPropsName addObject:[GoodsDetailsPropsName modelObjectWithDictionary:(NSDictionary *)receivedGoodsDetailsPropsName]];
    }

    self.propsName = [NSArray arrayWithArray:parsedGoodsDetailsPropsName];
            self.sizeTable = [GoodsDetailsSizeTable modelObjectWithDictionary:[dict objectForKey:kGoodsDetailsDataSizeTable]];
            self.taobaoNumIid = [self objectOrNilForKey:kGoodsDetailsDataTaobaoNumIid fromDictionary:dict];
            self.likesCount = [[self objectOrNilForKey:kGoodsDetailsDataLikesCount fromDictionary:dict] doubleValue];
            self.isCanUseCoupon = [[self objectOrNilForKey:kGoodsDetailsDataIsCanUseCoupon fromDictionary:dict] boolValue];
            self.pcCpsUrl = [self objectOrNilForKey:kGoodsDetailsDataPcCpsUrl fromDictionary:dict];
            self.discount = [self objectOrNilForKey:kGoodsDetailsDataDiscount fromDictionary:dict];
    NSObject *receivedGoodsDetailsMobileDesc = [dict objectForKey:kGoodsDetailsDataMobileDesc];
    NSMutableArray *parsedGoodsDetailsMobileDesc = [NSMutableArray array];
    if ([receivedGoodsDetailsMobileDesc isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGoodsDetailsMobileDesc) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGoodsDetailsMobileDesc addObject:[GoodsDetailsMobileDesc modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGoodsDetailsMobileDesc isKindOfClass:[NSDictionary class]]) {
       [parsedGoodsDetailsMobileDesc addObject:[GoodsDetailsMobileDesc modelObjectWithDictionary:(NSDictionary *)receivedGoodsDetailsMobileDesc]];
    }

    self.mobileDesc = [NSArray arrayWithArray:parsedGoodsDetailsMobileDesc];
            self.threeCommission = [self objectOrNilForKey:kGoodsDetailsDataThreeCommission fromDictionary:dict];
            self.oneCommission = [self objectOrNilForKey:kGoodsDetailsDataOneCommission fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.freightId forKey:kGoodsDetailsDataFreightId];
    NSMutableArray *tempArrayForPromos = [NSMutableArray array];
    for (NSObject *subArrayObject in self.promos) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPromos addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPromos addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromos] forKey:kGoodsDetailsDataPromos];
    NSMutableArray *tempArrayForService = [NSMutableArray array];
    for (NSObject *subArrayObject in self.service) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForService addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForService addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForService] forKey:kGoodsDetailsDataService];
    [mutableDict setValue:self.taobaoPromoPrice forKey:kGoodsDetailsDataTaobaoPromoPrice];
    [mutableDict setValue:self.taobaoSellingPrice forKey:kGoodsDetailsDataTaobaoSellingPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.integral] forKey:kGoodsDetailsDataIntegral];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qualityScore] forKey:kGoodsDetailsDataQualityScore];
    [mutableDict setValue:self.isCustomCommission forKey:kGoodsDetailsDataIsCustomCommission];
    [mutableDict setValue:self.lotteryId forKey:kGoodsDetailsDataLotteryId];
    [mutableDict setValue:self.fromLogoUrl forKey:kGoodsDetailsDataFromLogoUrl];
    [mutableDict setValue:self.fromTitle forKey:kGoodsDetailsDataFromTitle];
    [mutableDict setValue:[self.supplier dictionaryRepresentation] forKey:kGoodsDetailsDataSupplier];
    [mutableDict setValue:self.tagType forKey:kGoodsDetailsDataTagType];
    [mutableDict setValue:self.tagUrl forKey:kGoodsDetailsDataTagUrl];
    [mutableDict setValue:self.sharesCount forKey:kGoodsDetailsDataSharesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.visitsCount] forKey:kGoodsDetailsDataVisitsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.synthesisScore] forKey:kGoodsDetailsDataSynthesisScore];
    [mutableDict setValue:[self.brand dictionaryRepresentation] forKey:kGoodsDetailsDataBrand];
    NSMutableArray *tempArrayForTaobaoItemImgs = [NSMutableArray array];
    for (NSObject *subArrayObject in self.taobaoItemImgs) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTaobaoItemImgs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTaobaoItemImgs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTaobaoItemImgs] forKey:kGoodsDetailsDataTaobaoItemImgs];
    [mutableDict setValue:[NSNumber numberWithDouble:self.conformScore] forKey:kGoodsDetailsDataConformScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceScore] forKey:kGoodsDetailsDataPriceScore];
    [mutableDict setValue:self.lastLotteryId forKey:kGoodsDetailsDataLastLotteryId];
    [mutableDict setValue:self.commentsCount forKey:kGoodsDetailsDataCommentsCount];
    [mutableDict setValue:self.fromType forKey:kGoodsDetailsDataFromType];
    [mutableDict setValue:self.taobaoUrl forKey:kGoodsDetailsDataTaobaoUrl];
    NSMutableArray *tempArrayForSkus = [NSMutableArray array];
    for (NSObject *subArrayObject in self.skus) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSkus addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSkus addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSkus] forKey:kGoodsDetailsDataSkus];
    [mutableDict setValue:self.taobaoPicUrl forKey:kGoodsDetailsDataTaobaoPicUrl];
    [mutableDict setValue:self.taobaoSubtitle forKey:kGoodsDetailsDataTaobaoSubtitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobaoVolume] forKey:kGoodsDetailsDataTaobaoVolume];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDelist] forKey:kGoodsDetailsDataIsDelist];
    [mutableDict setValue:self.taobaoDelistTime forKey:kGoodsDetailsDataTaobaoDelistTime];
    [mutableDict setValue:self.productId forKey:kGoodsDetailsDataProductId];
    [mutableDict setValue:self.twoCommission forKey:kGoodsDetailsDataTwoCommission];
    [mutableDict setValue:[self.merchant dictionaryRepresentation] forKey:kGoodsDetailsDataMerchant];
    [mutableDict setValue:self.lotteryShowPrizesCount forKey:kGoodsDetailsDataLotteryShowPrizesCount];
    [mutableDict setValue:self.taobaoPrice forKey:kGoodsDetailsDataTaobaoPrice];
    [mutableDict setValue:self.taobaoTitle forKey:kGoodsDetailsDataTaobaoTitle];
    [mutableDict setValue:self.moneySymbol forKey:kGoodsDetailsDataMoneySymbol];
    [mutableDict setValue:self.mobileCpsUrl forKey:kGoodsDetailsDataMobileCpsUrl];
    NSMutableArray *tempArrayForPropsName = [NSMutableArray array];
    for (NSObject *subArrayObject in self.propsName) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPropsName addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPropsName addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPropsName] forKey:kGoodsDetailsDataPropsName];
    [mutableDict setValue:[self.sizeTable dictionaryRepresentation] forKey:kGoodsDetailsDataSizeTable];
    [mutableDict setValue:self.taobaoNumIid forKey:kGoodsDetailsDataTaobaoNumIid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kGoodsDetailsDataLikesCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCanUseCoupon] forKey:kGoodsDetailsDataIsCanUseCoupon];
    [mutableDict setValue:self.pcCpsUrl forKey:kGoodsDetailsDataPcCpsUrl];
    [mutableDict setValue:self.discount forKey:kGoodsDetailsDataDiscount];
    NSMutableArray *tempArrayForMobileDesc = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mobileDesc) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMobileDesc addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMobileDesc addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMobileDesc] forKey:kGoodsDetailsDataMobileDesc];
    [mutableDict setValue:self.threeCommission forKey:kGoodsDetailsDataThreeCommission];
    [mutableDict setValue:self.oneCommission forKey:kGoodsDetailsDataOneCommission];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.freightId = [aDecoder decodeObjectForKey:kGoodsDetailsDataFreightId];
    self.promos = [aDecoder decodeObjectForKey:kGoodsDetailsDataPromos];
    self.service = [aDecoder decodeObjectForKey:kGoodsDetailsDataService];
    self.taobaoPromoPrice = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoPromoPrice];
    self.taobaoSellingPrice = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoSellingPrice];
    self.integral = [aDecoder decodeDoubleForKey:kGoodsDetailsDataIntegral];
    self.qualityScore = [aDecoder decodeDoubleForKey:kGoodsDetailsDataQualityScore];
    self.isCustomCommission = [aDecoder decodeObjectForKey:kGoodsDetailsDataIsCustomCommission];
    self.lotteryId = [aDecoder decodeObjectForKey:kGoodsDetailsDataLotteryId];
    self.fromLogoUrl = [aDecoder decodeObjectForKey:kGoodsDetailsDataFromLogoUrl];
    self.fromTitle = [aDecoder decodeObjectForKey:kGoodsDetailsDataFromTitle];
    self.supplier = [aDecoder decodeObjectForKey:kGoodsDetailsDataSupplier];
    self.tagType = [aDecoder decodeObjectForKey:kGoodsDetailsDataTagType];
    self.tagUrl = [aDecoder decodeObjectForKey:kGoodsDetailsDataTagUrl];
    self.sharesCount = [aDecoder decodeObjectForKey:kGoodsDetailsDataSharesCount];
    self.visitsCount = [aDecoder decodeDoubleForKey:kGoodsDetailsDataVisitsCount];
    self.synthesisScore = [aDecoder decodeDoubleForKey:kGoodsDetailsDataSynthesisScore];
    self.brand = [aDecoder decodeObjectForKey:kGoodsDetailsDataBrand];
    self.taobaoItemImgs = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoItemImgs];
    self.conformScore = [aDecoder decodeDoubleForKey:kGoodsDetailsDataConformScore];
    self.priceScore = [aDecoder decodeDoubleForKey:kGoodsDetailsDataPriceScore];
    self.lastLotteryId = [aDecoder decodeObjectForKey:kGoodsDetailsDataLastLotteryId];
    self.commentsCount = [aDecoder decodeObjectForKey:kGoodsDetailsDataCommentsCount];
    self.fromType = [aDecoder decodeObjectForKey:kGoodsDetailsDataFromType];
    self.taobaoUrl = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoUrl];
    self.skus = [aDecoder decodeObjectForKey:kGoodsDetailsDataSkus];
    self.taobaoPicUrl = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoPicUrl];
    self.taobaoSubtitle = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoSubtitle];
    self.taobaoVolume = [aDecoder decodeDoubleForKey:kGoodsDetailsDataTaobaoVolume];
    self.isDelist = [aDecoder decodeBoolForKey:kGoodsDetailsDataIsDelist];
    self.taobaoDelistTime = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoDelistTime];
    self.productId = [aDecoder decodeObjectForKey:kGoodsDetailsDataProductId];
    self.twoCommission = [aDecoder decodeObjectForKey:kGoodsDetailsDataTwoCommission];
    self.merchant = [aDecoder decodeObjectForKey:kGoodsDetailsDataMerchant];
    self.lotteryShowPrizesCount = [aDecoder decodeObjectForKey:kGoodsDetailsDataLotteryShowPrizesCount];
    self.taobaoPrice = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoPrice];
    self.taobaoTitle = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoTitle];
    self.moneySymbol = [aDecoder decodeObjectForKey:kGoodsDetailsDataMoneySymbol];
    self.mobileCpsUrl = [aDecoder decodeObjectForKey:kGoodsDetailsDataMobileCpsUrl];
    self.propsName = [aDecoder decodeObjectForKey:kGoodsDetailsDataPropsName];
    self.sizeTable = [aDecoder decodeObjectForKey:kGoodsDetailsDataSizeTable];
    self.taobaoNumIid = [aDecoder decodeObjectForKey:kGoodsDetailsDataTaobaoNumIid];
    self.likesCount = [aDecoder decodeDoubleForKey:kGoodsDetailsDataLikesCount];
    self.isCanUseCoupon = [aDecoder decodeBoolForKey:kGoodsDetailsDataIsCanUseCoupon];
    self.pcCpsUrl = [aDecoder decodeObjectForKey:kGoodsDetailsDataPcCpsUrl];
    self.discount = [aDecoder decodeObjectForKey:kGoodsDetailsDataDiscount];
    self.mobileDesc = [aDecoder decodeObjectForKey:kGoodsDetailsDataMobileDesc];
    self.threeCommission = [aDecoder decodeObjectForKey:kGoodsDetailsDataThreeCommission];
    self.oneCommission = [aDecoder decodeObjectForKey:kGoodsDetailsDataOneCommission];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_freightId forKey:kGoodsDetailsDataFreightId];
    [aCoder encodeObject:_promos forKey:kGoodsDetailsDataPromos];
    [aCoder encodeObject:_service forKey:kGoodsDetailsDataService];
    [aCoder encodeObject:_taobaoPromoPrice forKey:kGoodsDetailsDataTaobaoPromoPrice];
    [aCoder encodeObject:_taobaoSellingPrice forKey:kGoodsDetailsDataTaobaoSellingPrice];
    [aCoder encodeDouble:_integral forKey:kGoodsDetailsDataIntegral];
    [aCoder encodeDouble:_qualityScore forKey:kGoodsDetailsDataQualityScore];
    [aCoder encodeObject:_isCustomCommission forKey:kGoodsDetailsDataIsCustomCommission];
    [aCoder encodeObject:_lotteryId forKey:kGoodsDetailsDataLotteryId];
    [aCoder encodeObject:_fromLogoUrl forKey:kGoodsDetailsDataFromLogoUrl];
    [aCoder encodeObject:_fromTitle forKey:kGoodsDetailsDataFromTitle];
    [aCoder encodeObject:_supplier forKey:kGoodsDetailsDataSupplier];
    [aCoder encodeObject:_tagType forKey:kGoodsDetailsDataTagType];
    [aCoder encodeObject:_tagUrl forKey:kGoodsDetailsDataTagUrl];
    [aCoder encodeObject:_sharesCount forKey:kGoodsDetailsDataSharesCount];
    [aCoder encodeDouble:_visitsCount forKey:kGoodsDetailsDataVisitsCount];
    [aCoder encodeDouble:_synthesisScore forKey:kGoodsDetailsDataSynthesisScore];
    [aCoder encodeObject:_brand forKey:kGoodsDetailsDataBrand];
    [aCoder encodeObject:_taobaoItemImgs forKey:kGoodsDetailsDataTaobaoItemImgs];
    [aCoder encodeDouble:_conformScore forKey:kGoodsDetailsDataConformScore];
    [aCoder encodeDouble:_priceScore forKey:kGoodsDetailsDataPriceScore];
    [aCoder encodeObject:_lastLotteryId forKey:kGoodsDetailsDataLastLotteryId];
    [aCoder encodeObject:_commentsCount forKey:kGoodsDetailsDataCommentsCount];
    [aCoder encodeObject:_fromType forKey:kGoodsDetailsDataFromType];
    [aCoder encodeObject:_taobaoUrl forKey:kGoodsDetailsDataTaobaoUrl];
    [aCoder encodeObject:_skus forKey:kGoodsDetailsDataSkus];
    [aCoder encodeObject:_taobaoPicUrl forKey:kGoodsDetailsDataTaobaoPicUrl];
    [aCoder encodeObject:_taobaoSubtitle forKey:kGoodsDetailsDataTaobaoSubtitle];
    [aCoder encodeDouble:_taobaoVolume forKey:kGoodsDetailsDataTaobaoVolume];
    [aCoder encodeBool:_isDelist forKey:kGoodsDetailsDataIsDelist];
    [aCoder encodeObject:_taobaoDelistTime forKey:kGoodsDetailsDataTaobaoDelistTime];
    [aCoder encodeObject:_productId forKey:kGoodsDetailsDataProductId];
    [aCoder encodeObject:_twoCommission forKey:kGoodsDetailsDataTwoCommission];
    [aCoder encodeObject:_merchant forKey:kGoodsDetailsDataMerchant];
    [aCoder encodeObject:_lotteryShowPrizesCount forKey:kGoodsDetailsDataLotteryShowPrizesCount];
    [aCoder encodeObject:_taobaoPrice forKey:kGoodsDetailsDataTaobaoPrice];
    [aCoder encodeObject:_taobaoTitle forKey:kGoodsDetailsDataTaobaoTitle];
    [aCoder encodeObject:_moneySymbol forKey:kGoodsDetailsDataMoneySymbol];
    [aCoder encodeObject:_mobileCpsUrl forKey:kGoodsDetailsDataMobileCpsUrl];
    [aCoder encodeObject:_propsName forKey:kGoodsDetailsDataPropsName];
    [aCoder encodeObject:_sizeTable forKey:kGoodsDetailsDataSizeTable];
    [aCoder encodeObject:_taobaoNumIid forKey:kGoodsDetailsDataTaobaoNumIid];
    [aCoder encodeDouble:_likesCount forKey:kGoodsDetailsDataLikesCount];
    [aCoder encodeBool:_isCanUseCoupon forKey:kGoodsDetailsDataIsCanUseCoupon];
    [aCoder encodeObject:_pcCpsUrl forKey:kGoodsDetailsDataPcCpsUrl];
    [aCoder encodeObject:_discount forKey:kGoodsDetailsDataDiscount];
    [aCoder encodeObject:_mobileDesc forKey:kGoodsDetailsDataMobileDesc];
    [aCoder encodeObject:_threeCommission forKey:kGoodsDetailsDataThreeCommission];
    [aCoder encodeObject:_oneCommission forKey:kGoodsDetailsDataOneCommission];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsData *copy = [[GoodsDetailsData alloc] init];
    
    if (copy) {

        copy.freightId = [self.freightId copyWithZone:zone];
        copy.promos = [self.promos copyWithZone:zone];
        copy.service = [self.service copyWithZone:zone];
        copy.taobaoPromoPrice = [self.taobaoPromoPrice copyWithZone:zone];
        copy.taobaoSellingPrice = [self.taobaoSellingPrice copyWithZone:zone];
        copy.integral = self.integral;
        copy.qualityScore = self.qualityScore;
        copy.isCustomCommission = [self.isCustomCommission copyWithZone:zone];
        copy.lotteryId = [self.lotteryId copyWithZone:zone];
        copy.fromLogoUrl = [self.fromLogoUrl copyWithZone:zone];
        copy.fromTitle = [self.fromTitle copyWithZone:zone];
        copy.supplier = [self.supplier copyWithZone:zone];
        copy.tagType = [self.tagType copyWithZone:zone];
        copy.tagUrl = [self.tagUrl copyWithZone:zone];
        copy.sharesCount = [self.sharesCount copyWithZone:zone];
        copy.visitsCount = self.visitsCount;
        copy.synthesisScore = self.synthesisScore;
        copy.brand = [self.brand copyWithZone:zone];
        copy.taobaoItemImgs = [self.taobaoItemImgs copyWithZone:zone];
        copy.conformScore = self.conformScore;
        copy.priceScore = self.priceScore;
        copy.lastLotteryId = [self.lastLotteryId copyWithZone:zone];
        copy.commentsCount = [self.commentsCount copyWithZone:zone];
        copy.fromType = [self.fromType copyWithZone:zone];
        copy.taobaoUrl = [self.taobaoUrl copyWithZone:zone];
        copy.skus = [self.skus copyWithZone:zone];
        copy.taobaoPicUrl = [self.taobaoPicUrl copyWithZone:zone];
        copy.taobaoSubtitle = [self.taobaoSubtitle copyWithZone:zone];
        copy.taobaoVolume = self.taobaoVolume;
        copy.isDelist = self.isDelist;
        copy.taobaoDelistTime = [self.taobaoDelistTime copyWithZone:zone];
        copy.productId = [self.productId copyWithZone:zone];
        copy.twoCommission = [self.twoCommission copyWithZone:zone];
        copy.merchant = [self.merchant copyWithZone:zone];
        copy.lotteryShowPrizesCount = [self.lotteryShowPrizesCount copyWithZone:zone];
        copy.taobaoPrice = [self.taobaoPrice copyWithZone:zone];
        copy.taobaoTitle = [self.taobaoTitle copyWithZone:zone];
        copy.moneySymbol = [self.moneySymbol copyWithZone:zone];
        copy.mobileCpsUrl = [self.mobileCpsUrl copyWithZone:zone];
        copy.propsName = [self.propsName copyWithZone:zone];
        copy.sizeTable = [self.sizeTable copyWithZone:zone];
        copy.taobaoNumIid = [self.taobaoNumIid copyWithZone:zone];
        copy.likesCount = self.likesCount;
        copy.isCanUseCoupon = self.isCanUseCoupon;
        copy.pcCpsUrl = [self.pcCpsUrl copyWithZone:zone];
        copy.discount = [self.discount copyWithZone:zone];
        copy.mobileDesc = [self.mobileDesc copyWithZone:zone];
        copy.threeCommission = [self.threeCommission copyWithZone:zone];
        copy.oneCommission = [self.oneCommission copyWithZone:zone];
    }
    
    return copy;
}


@end
