//
//  HomeCollectionViewCellProducts.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeCollectionViewCellProducts.h"
#import "HomeCollectionViewCellSupplier.h"
#import "HomeCollectionViewCellBrand.h"
#import "HomeCollectionViewCellTaobaoItemImgs.h"
#import "HomeCollectionViewCellMerchant.h"


NSString *const kHomeCollectionViewCellProductsTaobaoPromoPrice = @"taobao_promo_price";
NSString *const kHomeCollectionViewCellProductsTaobaoSellingPrice = @"taobao_selling_price";
NSString *const kHomeCollectionViewCellProductsIntegral = @"integral";
NSString *const kHomeCollectionViewCellProductsQualityScore = @"quality_score";
NSString *const kHomeCollectionViewCellProductsLotteryId = @"lottery_id";
NSString *const kHomeCollectionViewCellProductsFromLogoUrl = @"from_logo_url";
NSString *const kHomeCollectionViewCellProductsFromTitle = @"from_title";
NSString *const kHomeCollectionViewCellProductsSupplier = @"supplier";
NSString *const kHomeCollectionViewCellProductsTagType = @"tag_type";
NSString *const kHomeCollectionViewCellProductsTagUrl = @"tag_url";
NSString *const kHomeCollectionViewCellProductsSharesCount = @"shares_count";
NSString *const kHomeCollectionViewCellProductsVisitsCount = @"visits_count";
NSString *const kHomeCollectionViewCellProductsSynthesisScore = @"synthesis_score";
NSString *const kHomeCollectionViewCellProductsBrand = @"brand";
NSString *const kHomeCollectionViewCellProductsTaobaoItemImgs = @"taobao_item_imgs";
NSString *const kHomeCollectionViewCellProductsConformScore = @"conform_score";
NSString *const kHomeCollectionViewCellProductsPriceScore = @"price_score";
NSString *const kHomeCollectionViewCellProductsLastLotteryId = @"last_lottery_id";
NSString *const kHomeCollectionViewCellProductsCommentsCount = @"comments_count";
NSString *const kHomeCollectionViewCellProductsFromType = @"from_type";
NSString *const kHomeCollectionViewCellProductsTaobaoUrl = @"taobao_url";
NSString *const kHomeCollectionViewCellProductsTaobaoPicUrl = @"taobao_pic_url";
NSString *const kHomeCollectionViewCellProductsTaobaoSubtitle = @"taobao_subtitle";
NSString *const kHomeCollectionViewCellProductsTaobaoVolume = @"taobao_volume";
NSString *const kHomeCollectionViewCellProductsIsDelist = @"is_delist";
NSString *const kHomeCollectionViewCellProductsTaobaoDelistTime = @"taobao_delist_time";
NSString *const kHomeCollectionViewCellProductsProductId = @"product_id";
NSString *const kHomeCollectionViewCellProductsMerchant = @"merchant";
NSString *const kHomeCollectionViewCellProductsTaobaoPrice = @"taobao_price";
NSString *const kHomeCollectionViewCellProductsTaobaoTitle = @"taobao_title";
NSString *const kHomeCollectionViewCellProductsMoneySymbol = @"money_symbol";
NSString *const kHomeCollectionViewCellProductsMobileCpsUrl = @"mobile_cps_url";
NSString *const kHomeCollectionViewCellProductsTaobaoNumIid = @"taobao_num_iid";
NSString *const kHomeCollectionViewCellProductsLikesCount = @"likes_count";
NSString *const kHomeCollectionViewCellProductsPcCpsUrl = @"pc_cps_url";
NSString *const kHomeCollectionViewCellProductsDiscount = @"discount";


@interface HomeCollectionViewCellProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeCollectionViewCellProducts

@synthesize taobaoPromoPrice = _taobaoPromoPrice;
@synthesize taobaoSellingPrice = _taobaoSellingPrice;
@synthesize integral = _integral;
@synthesize qualityScore = _qualityScore;
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
@synthesize taobaoPicUrl = _taobaoPicUrl;
@synthesize taobaoSubtitle = _taobaoSubtitle;
@synthesize taobaoVolume = _taobaoVolume;
@synthesize isDelist = _isDelist;
@synthesize taobaoDelistTime = _taobaoDelistTime;
@synthesize productId = _productId;
@synthesize merchant = _merchant;
@synthesize taobaoPrice = _taobaoPrice;
@synthesize taobaoTitle = _taobaoTitle;
@synthesize moneySymbol = _moneySymbol;
@synthesize mobileCpsUrl = _mobileCpsUrl;
@synthesize taobaoNumIid = _taobaoNumIid;
@synthesize likesCount = _likesCount;
@synthesize pcCpsUrl = _pcCpsUrl;
@synthesize discount = _discount;


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
            self.taobaoPromoPrice = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoPromoPrice fromDictionary:dict];
            self.taobaoSellingPrice = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoSellingPrice fromDictionary:dict];
            self.integral = [[self objectOrNilForKey:kHomeCollectionViewCellProductsIntegral fromDictionary:dict] doubleValue];
            self.qualityScore = [[self objectOrNilForKey:kHomeCollectionViewCellProductsQualityScore fromDictionary:dict] doubleValue];
            self.lotteryId = [self objectOrNilForKey:kHomeCollectionViewCellProductsLotteryId fromDictionary:dict];
            self.fromLogoUrl = [self objectOrNilForKey:kHomeCollectionViewCellProductsFromLogoUrl fromDictionary:dict];
            self.fromTitle = [self objectOrNilForKey:kHomeCollectionViewCellProductsFromTitle fromDictionary:dict];
            self.supplier = [HomeCollectionViewCellSupplier modelObjectWithDictionary:[dict objectForKey:kHomeCollectionViewCellProductsSupplier]];
            self.tagType = [self objectOrNilForKey:kHomeCollectionViewCellProductsTagType fromDictionary:dict];
            self.tagUrl = [self objectOrNilForKey:kHomeCollectionViewCellProductsTagUrl fromDictionary:dict];
            self.sharesCount = [self objectOrNilForKey:kHomeCollectionViewCellProductsSharesCount fromDictionary:dict];
            self.visitsCount = [[self objectOrNilForKey:kHomeCollectionViewCellProductsVisitsCount fromDictionary:dict] doubleValue];
            self.synthesisScore = [[self objectOrNilForKey:kHomeCollectionViewCellProductsSynthesisScore fromDictionary:dict] doubleValue];
            self.brand = [HomeCollectionViewCellBrand modelObjectWithDictionary:[dict objectForKey:kHomeCollectionViewCellProductsBrand]];
    NSObject *receivedHomeCollectionViewCellTaobaoItemImgs = [dict objectForKey:kHomeCollectionViewCellProductsTaobaoItemImgs];
    NSMutableArray *parsedHomeCollectionViewCellTaobaoItemImgs = [NSMutableArray array];
    if ([receivedHomeCollectionViewCellTaobaoItemImgs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeCollectionViewCellTaobaoItemImgs) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeCollectionViewCellTaobaoItemImgs addObject:[HomeCollectionViewCellTaobaoItemImgs modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeCollectionViewCellTaobaoItemImgs isKindOfClass:[NSDictionary class]]) {
       [parsedHomeCollectionViewCellTaobaoItemImgs addObject:[HomeCollectionViewCellTaobaoItemImgs modelObjectWithDictionary:(NSDictionary *)receivedHomeCollectionViewCellTaobaoItemImgs]];
    }

    self.taobaoItemImgs = [NSArray arrayWithArray:parsedHomeCollectionViewCellTaobaoItemImgs];
            self.conformScore = [[self objectOrNilForKey:kHomeCollectionViewCellProductsConformScore fromDictionary:dict] doubleValue];
            self.priceScore = [[self objectOrNilForKey:kHomeCollectionViewCellProductsPriceScore fromDictionary:dict] doubleValue];
            self.lastLotteryId = [self objectOrNilForKey:kHomeCollectionViewCellProductsLastLotteryId fromDictionary:dict];
            self.commentsCount = [self objectOrNilForKey:kHomeCollectionViewCellProductsCommentsCount fromDictionary:dict];
            self.fromType = [self objectOrNilForKey:kHomeCollectionViewCellProductsFromType fromDictionary:dict];
            self.taobaoUrl = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoUrl fromDictionary:dict];
            self.taobaoPicUrl = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoPicUrl fromDictionary:dict];
            self.taobaoSubtitle = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoSubtitle fromDictionary:dict];
            self.taobaoVolume = [[self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoVolume fromDictionary:dict] doubleValue];
            self.isDelist = [[self objectOrNilForKey:kHomeCollectionViewCellProductsIsDelist fromDictionary:dict] boolValue];
            self.taobaoDelistTime = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoDelistTime fromDictionary:dict];
            self.productId = [self objectOrNilForKey:kHomeCollectionViewCellProductsProductId fromDictionary:dict];
            self.merchant = [HomeCollectionViewCellMerchant modelObjectWithDictionary:[dict objectForKey:kHomeCollectionViewCellProductsMerchant]];
            self.taobaoPrice = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoPrice fromDictionary:dict];
            self.taobaoTitle = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoTitle fromDictionary:dict];
            self.moneySymbol = [self objectOrNilForKey:kHomeCollectionViewCellProductsMoneySymbol fromDictionary:dict];
            self.mobileCpsUrl = [self objectOrNilForKey:kHomeCollectionViewCellProductsMobileCpsUrl fromDictionary:dict];
            self.taobaoNumIid = [self objectOrNilForKey:kHomeCollectionViewCellProductsTaobaoNumIid fromDictionary:dict];
            self.likesCount = [[self objectOrNilForKey:kHomeCollectionViewCellProductsLikesCount fromDictionary:dict] doubleValue];
            self.pcCpsUrl = [self objectOrNilForKey:kHomeCollectionViewCellProductsPcCpsUrl fromDictionary:dict];
            self.discount = [self objectOrNilForKey:kHomeCollectionViewCellProductsDiscount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.taobaoPromoPrice forKey:kHomeCollectionViewCellProductsTaobaoPromoPrice];
    [mutableDict setValue:self.taobaoSellingPrice forKey:kHomeCollectionViewCellProductsTaobaoSellingPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.integral] forKey:kHomeCollectionViewCellProductsIntegral];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qualityScore] forKey:kHomeCollectionViewCellProductsQualityScore];
    [mutableDict setValue:self.lotteryId forKey:kHomeCollectionViewCellProductsLotteryId];
    [mutableDict setValue:self.fromLogoUrl forKey:kHomeCollectionViewCellProductsFromLogoUrl];
    [mutableDict setValue:self.fromTitle forKey:kHomeCollectionViewCellProductsFromTitle];
    [mutableDict setValue:[self.supplier dictionaryRepresentation] forKey:kHomeCollectionViewCellProductsSupplier];
    [mutableDict setValue:self.tagType forKey:kHomeCollectionViewCellProductsTagType];
    [mutableDict setValue:self.tagUrl forKey:kHomeCollectionViewCellProductsTagUrl];
    [mutableDict setValue:self.sharesCount forKey:kHomeCollectionViewCellProductsSharesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.visitsCount] forKey:kHomeCollectionViewCellProductsVisitsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.synthesisScore] forKey:kHomeCollectionViewCellProductsSynthesisScore];
    [mutableDict setValue:[self.brand dictionaryRepresentation] forKey:kHomeCollectionViewCellProductsBrand];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTaobaoItemImgs] forKey:kHomeCollectionViewCellProductsTaobaoItemImgs];
    [mutableDict setValue:[NSNumber numberWithDouble:self.conformScore] forKey:kHomeCollectionViewCellProductsConformScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceScore] forKey:kHomeCollectionViewCellProductsPriceScore];
    [mutableDict setValue:self.lastLotteryId forKey:kHomeCollectionViewCellProductsLastLotteryId];
    [mutableDict setValue:self.commentsCount forKey:kHomeCollectionViewCellProductsCommentsCount];
    [mutableDict setValue:self.fromType forKey:kHomeCollectionViewCellProductsFromType];
    [mutableDict setValue:self.taobaoUrl forKey:kHomeCollectionViewCellProductsTaobaoUrl];
    [mutableDict setValue:self.taobaoPicUrl forKey:kHomeCollectionViewCellProductsTaobaoPicUrl];
    [mutableDict setValue:self.taobaoSubtitle forKey:kHomeCollectionViewCellProductsTaobaoSubtitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobaoVolume] forKey:kHomeCollectionViewCellProductsTaobaoVolume];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDelist] forKey:kHomeCollectionViewCellProductsIsDelist];
    [mutableDict setValue:self.taobaoDelistTime forKey:kHomeCollectionViewCellProductsTaobaoDelistTime];
    [mutableDict setValue:self.productId forKey:kHomeCollectionViewCellProductsProductId];
    [mutableDict setValue:[self.merchant dictionaryRepresentation] forKey:kHomeCollectionViewCellProductsMerchant];
    [mutableDict setValue:self.taobaoPrice forKey:kHomeCollectionViewCellProductsTaobaoPrice];
    [mutableDict setValue:self.taobaoTitle forKey:kHomeCollectionViewCellProductsTaobaoTitle];
    [mutableDict setValue:self.moneySymbol forKey:kHomeCollectionViewCellProductsMoneySymbol];
    [mutableDict setValue:self.mobileCpsUrl forKey:kHomeCollectionViewCellProductsMobileCpsUrl];
    [mutableDict setValue:self.taobaoNumIid forKey:kHomeCollectionViewCellProductsTaobaoNumIid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kHomeCollectionViewCellProductsLikesCount];
    [mutableDict setValue:self.pcCpsUrl forKey:kHomeCollectionViewCellProductsPcCpsUrl];
    [mutableDict setValue:self.discount forKey:kHomeCollectionViewCellProductsDiscount];

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

    self.taobaoPromoPrice = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoPromoPrice];
    self.taobaoSellingPrice = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoSellingPrice];
    self.integral = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsIntegral];
    self.qualityScore = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsQualityScore];
    self.lotteryId = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsLotteryId];
    self.fromLogoUrl = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsFromLogoUrl];
    self.fromTitle = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsFromTitle];
    self.supplier = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsSupplier];
    self.tagType = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTagType];
    self.tagUrl = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTagUrl];
    self.sharesCount = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsSharesCount];
    self.visitsCount = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsVisitsCount];
    self.synthesisScore = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsSynthesisScore];
    self.brand = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsBrand];
    self.taobaoItemImgs = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoItemImgs];
    self.conformScore = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsConformScore];
    self.priceScore = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsPriceScore];
    self.lastLotteryId = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsLastLotteryId];
    self.commentsCount = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsCommentsCount];
    self.fromType = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsFromType];
    self.taobaoUrl = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoUrl];
    self.taobaoPicUrl = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoPicUrl];
    self.taobaoSubtitle = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoSubtitle];
    self.taobaoVolume = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsTaobaoVolume];
    self.isDelist = [aDecoder decodeBoolForKey:kHomeCollectionViewCellProductsIsDelist];
    self.taobaoDelistTime = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoDelistTime];
    self.productId = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsProductId];
    self.merchant = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsMerchant];
    self.taobaoPrice = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoPrice];
    self.taobaoTitle = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoTitle];
    self.moneySymbol = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsMoneySymbol];
    self.mobileCpsUrl = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsMobileCpsUrl];
    self.taobaoNumIid = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsTaobaoNumIid];
    self.likesCount = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellProductsLikesCount];
    self.pcCpsUrl = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsPcCpsUrl];
    self.discount = [aDecoder decodeObjectForKey:kHomeCollectionViewCellProductsDiscount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_taobaoPromoPrice forKey:kHomeCollectionViewCellProductsTaobaoPromoPrice];
    [aCoder encodeObject:_taobaoSellingPrice forKey:kHomeCollectionViewCellProductsTaobaoSellingPrice];
    [aCoder encodeDouble:_integral forKey:kHomeCollectionViewCellProductsIntegral];
    [aCoder encodeDouble:_qualityScore forKey:kHomeCollectionViewCellProductsQualityScore];
    [aCoder encodeObject:_lotteryId forKey:kHomeCollectionViewCellProductsLotteryId];
    [aCoder encodeObject:_fromLogoUrl forKey:kHomeCollectionViewCellProductsFromLogoUrl];
    [aCoder encodeObject:_fromTitle forKey:kHomeCollectionViewCellProductsFromTitle];
    [aCoder encodeObject:_supplier forKey:kHomeCollectionViewCellProductsSupplier];
    [aCoder encodeObject:_tagType forKey:kHomeCollectionViewCellProductsTagType];
    [aCoder encodeObject:_tagUrl forKey:kHomeCollectionViewCellProductsTagUrl];
    [aCoder encodeObject:_sharesCount forKey:kHomeCollectionViewCellProductsSharesCount];
    [aCoder encodeDouble:_visitsCount forKey:kHomeCollectionViewCellProductsVisitsCount];
    [aCoder encodeDouble:_synthesisScore forKey:kHomeCollectionViewCellProductsSynthesisScore];
    [aCoder encodeObject:_brand forKey:kHomeCollectionViewCellProductsBrand];
    [aCoder encodeObject:_taobaoItemImgs forKey:kHomeCollectionViewCellProductsTaobaoItemImgs];
    [aCoder encodeDouble:_conformScore forKey:kHomeCollectionViewCellProductsConformScore];
    [aCoder encodeDouble:_priceScore forKey:kHomeCollectionViewCellProductsPriceScore];
    [aCoder encodeObject:_lastLotteryId forKey:kHomeCollectionViewCellProductsLastLotteryId];
    [aCoder encodeObject:_commentsCount forKey:kHomeCollectionViewCellProductsCommentsCount];
    [aCoder encodeObject:_fromType forKey:kHomeCollectionViewCellProductsFromType];
    [aCoder encodeObject:_taobaoUrl forKey:kHomeCollectionViewCellProductsTaobaoUrl];
    [aCoder encodeObject:_taobaoPicUrl forKey:kHomeCollectionViewCellProductsTaobaoPicUrl];
    [aCoder encodeObject:_taobaoSubtitle forKey:kHomeCollectionViewCellProductsTaobaoSubtitle];
    [aCoder encodeDouble:_taobaoVolume forKey:kHomeCollectionViewCellProductsTaobaoVolume];
    [aCoder encodeBool:_isDelist forKey:kHomeCollectionViewCellProductsIsDelist];
    [aCoder encodeObject:_taobaoDelistTime forKey:kHomeCollectionViewCellProductsTaobaoDelistTime];
    [aCoder encodeObject:_productId forKey:kHomeCollectionViewCellProductsProductId];
    [aCoder encodeObject:_merchant forKey:kHomeCollectionViewCellProductsMerchant];
    [aCoder encodeObject:_taobaoPrice forKey:kHomeCollectionViewCellProductsTaobaoPrice];
    [aCoder encodeObject:_taobaoTitle forKey:kHomeCollectionViewCellProductsTaobaoTitle];
    [aCoder encodeObject:_moneySymbol forKey:kHomeCollectionViewCellProductsMoneySymbol];
    [aCoder encodeObject:_mobileCpsUrl forKey:kHomeCollectionViewCellProductsMobileCpsUrl];
    [aCoder encodeObject:_taobaoNumIid forKey:kHomeCollectionViewCellProductsTaobaoNumIid];
    [aCoder encodeDouble:_likesCount forKey:kHomeCollectionViewCellProductsLikesCount];
    [aCoder encodeObject:_pcCpsUrl forKey:kHomeCollectionViewCellProductsPcCpsUrl];
    [aCoder encodeObject:_discount forKey:kHomeCollectionViewCellProductsDiscount];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeCollectionViewCellProducts *copy = [[HomeCollectionViewCellProducts alloc] init];
    
    if (copy) {

        copy.taobaoPromoPrice = [self.taobaoPromoPrice copyWithZone:zone];
        copy.taobaoSellingPrice = [self.taobaoSellingPrice copyWithZone:zone];
        copy.integral = self.integral;
        copy.qualityScore = self.qualityScore;
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
        copy.taobaoPicUrl = [self.taobaoPicUrl copyWithZone:zone];
        copy.taobaoSubtitle = [self.taobaoSubtitle copyWithZone:zone];
        copy.taobaoVolume = self.taobaoVolume;
        copy.isDelist = self.isDelist;
        copy.taobaoDelistTime = [self.taobaoDelistTime copyWithZone:zone];
        copy.productId = [self.productId copyWithZone:zone];
        copy.merchant = [self.merchant copyWithZone:zone];
        copy.taobaoPrice = [self.taobaoPrice copyWithZone:zone];
        copy.taobaoTitle = [self.taobaoTitle copyWithZone:zone];
        copy.moneySymbol = [self.moneySymbol copyWithZone:zone];
        copy.mobileCpsUrl = [self.mobileCpsUrl copyWithZone:zone];
        copy.taobaoNumIid = [self.taobaoNumIid copyWithZone:zone];
        copy.likesCount = self.likesCount;
        copy.pcCpsUrl = [self.pcCpsUrl copyWithZone:zone];
        copy.discount = [self.discount copyWithZone:zone];
    }
    
    return copy;
}


@end
