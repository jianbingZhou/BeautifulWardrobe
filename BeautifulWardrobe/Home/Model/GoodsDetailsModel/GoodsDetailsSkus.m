//
//  GoodsDetailsSkus.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsSkus.h"


NSString *const kGoodsDetailsSkusTaobaoTitle = @"taobao_title";
NSString *const kGoodsDetailsSkusStyle = @"style";
NSString *const kGoodsDetailsSkusMoneySymbol = @"money_symbol";
NSString *const kGoodsDetailsSkusQuantity = @"quantity";
NSString *const kGoodsDetailsSkusTaobaoPrice = @"taobao_price";
NSString *const kGoodsDetailsSkusSizeKey = @"size_key";
NSString *const kGoodsDetailsSkusTaobaoSellingPrice = @"taobao_selling_price";
NSString *const kGoodsDetailsSkusSkuId = @"sku_id";
NSString *const kGoodsDetailsSkusStyleKey = @"style_key";
NSString *const kGoodsDetailsSkusTaobaoPicUrl = @"taobao_pic_url";
NSString *const kGoodsDetailsSkusSize = @"size";
NSString *const kGoodsDetailsSkusIsUseCoupon = @"is_use_coupon";
NSString *const kGoodsDetailsSkusIntegral = @"integral";
NSString *const kGoodsDetailsSkusTaobaoNumIid = @"taobao_num_iid";
NSString *const kGoodsDetailsSkusStatus = @"status";


@interface GoodsDetailsSkus ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsSkus

@synthesize taobaoTitle = _taobaoTitle;
@synthesize style = _style;
@synthesize moneySymbol = _moneySymbol;
@synthesize quantity = _quantity;
@synthesize taobaoPrice = _taobaoPrice;
@synthesize sizeKey = _sizeKey;
@synthesize taobaoSellingPrice = _taobaoSellingPrice;
@synthesize skuId = _skuId;
@synthesize styleKey = _styleKey;
@synthesize taobaoPicUrl = _taobaoPicUrl;
@synthesize size = _size;
@synthesize isUseCoupon = _isUseCoupon;
@synthesize integral = _integral;
@synthesize taobaoNumIid = _taobaoNumIid;
@synthesize status = _status;


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
            self.taobaoTitle = [self objectOrNilForKey:kGoodsDetailsSkusTaobaoTitle fromDictionary:dict];
            self.style = [self objectOrNilForKey:kGoodsDetailsSkusStyle fromDictionary:dict];
            self.moneySymbol = [self objectOrNilForKey:kGoodsDetailsSkusMoneySymbol fromDictionary:dict];
            self.quantity = [self objectOrNilForKey:kGoodsDetailsSkusQuantity fromDictionary:dict];
            self.taobaoPrice = [self objectOrNilForKey:kGoodsDetailsSkusTaobaoPrice fromDictionary:dict];
            self.sizeKey = [self objectOrNilForKey:kGoodsDetailsSkusSizeKey fromDictionary:dict];
            self.taobaoSellingPrice = [self objectOrNilForKey:kGoodsDetailsSkusTaobaoSellingPrice fromDictionary:dict];
            self.skuId = [self objectOrNilForKey:kGoodsDetailsSkusSkuId fromDictionary:dict];
            self.styleKey = [self objectOrNilForKey:kGoodsDetailsSkusStyleKey fromDictionary:dict];
            self.taobaoPicUrl = [self objectOrNilForKey:kGoodsDetailsSkusTaobaoPicUrl fromDictionary:dict];
            self.size = [self objectOrNilForKey:kGoodsDetailsSkusSize fromDictionary:dict];
            self.isUseCoupon = [self objectOrNilForKey:kGoodsDetailsSkusIsUseCoupon fromDictionary:dict];
            self.integral = [[self objectOrNilForKey:kGoodsDetailsSkusIntegral fromDictionary:dict] doubleValue];
            self.taobaoNumIid = [self objectOrNilForKey:kGoodsDetailsSkusTaobaoNumIid fromDictionary:dict];
            self.status = [self objectOrNilForKey:kGoodsDetailsSkusStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.taobaoTitle forKey:kGoodsDetailsSkusTaobaoTitle];
    [mutableDict setValue:self.style forKey:kGoodsDetailsSkusStyle];
    [mutableDict setValue:self.moneySymbol forKey:kGoodsDetailsSkusMoneySymbol];
    [mutableDict setValue:self.quantity forKey:kGoodsDetailsSkusQuantity];
    [mutableDict setValue:self.taobaoPrice forKey:kGoodsDetailsSkusTaobaoPrice];
    [mutableDict setValue:self.sizeKey forKey:kGoodsDetailsSkusSizeKey];
    [mutableDict setValue:self.taobaoSellingPrice forKey:kGoodsDetailsSkusTaobaoSellingPrice];
    [mutableDict setValue:self.skuId forKey:kGoodsDetailsSkusSkuId];
    [mutableDict setValue:self.styleKey forKey:kGoodsDetailsSkusStyleKey];
    [mutableDict setValue:self.taobaoPicUrl forKey:kGoodsDetailsSkusTaobaoPicUrl];
    [mutableDict setValue:self.size forKey:kGoodsDetailsSkusSize];
    [mutableDict setValue:self.isUseCoupon forKey:kGoodsDetailsSkusIsUseCoupon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.integral] forKey:kGoodsDetailsSkusIntegral];
    [mutableDict setValue:self.taobaoNumIid forKey:kGoodsDetailsSkusTaobaoNumIid];
    [mutableDict setValue:self.status forKey:kGoodsDetailsSkusStatus];

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

    self.taobaoTitle = [aDecoder decodeObjectForKey:kGoodsDetailsSkusTaobaoTitle];
    self.style = [aDecoder decodeObjectForKey:kGoodsDetailsSkusStyle];
    self.moneySymbol = [aDecoder decodeObjectForKey:kGoodsDetailsSkusMoneySymbol];
    self.quantity = [aDecoder decodeObjectForKey:kGoodsDetailsSkusQuantity];
    self.taobaoPrice = [aDecoder decodeObjectForKey:kGoodsDetailsSkusTaobaoPrice];
    self.sizeKey = [aDecoder decodeObjectForKey:kGoodsDetailsSkusSizeKey];
    self.taobaoSellingPrice = [aDecoder decodeObjectForKey:kGoodsDetailsSkusTaobaoSellingPrice];
    self.skuId = [aDecoder decodeObjectForKey:kGoodsDetailsSkusSkuId];
    self.styleKey = [aDecoder decodeObjectForKey:kGoodsDetailsSkusStyleKey];
    self.taobaoPicUrl = [aDecoder decodeObjectForKey:kGoodsDetailsSkusTaobaoPicUrl];
    self.size = [aDecoder decodeObjectForKey:kGoodsDetailsSkusSize];
    self.isUseCoupon = [aDecoder decodeObjectForKey:kGoodsDetailsSkusIsUseCoupon];
    self.integral = [aDecoder decodeDoubleForKey:kGoodsDetailsSkusIntegral];
    self.taobaoNumIid = [aDecoder decodeObjectForKey:kGoodsDetailsSkusTaobaoNumIid];
    self.status = [aDecoder decodeObjectForKey:kGoodsDetailsSkusStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_taobaoTitle forKey:kGoodsDetailsSkusTaobaoTitle];
    [aCoder encodeObject:_style forKey:kGoodsDetailsSkusStyle];
    [aCoder encodeObject:_moneySymbol forKey:kGoodsDetailsSkusMoneySymbol];
    [aCoder encodeObject:_quantity forKey:kGoodsDetailsSkusQuantity];
    [aCoder encodeObject:_taobaoPrice forKey:kGoodsDetailsSkusTaobaoPrice];
    [aCoder encodeObject:_sizeKey forKey:kGoodsDetailsSkusSizeKey];
    [aCoder encodeObject:_taobaoSellingPrice forKey:kGoodsDetailsSkusTaobaoSellingPrice];
    [aCoder encodeObject:_skuId forKey:kGoodsDetailsSkusSkuId];
    [aCoder encodeObject:_styleKey forKey:kGoodsDetailsSkusStyleKey];
    [aCoder encodeObject:_taobaoPicUrl forKey:kGoodsDetailsSkusTaobaoPicUrl];
    [aCoder encodeObject:_size forKey:kGoodsDetailsSkusSize];
    [aCoder encodeObject:_isUseCoupon forKey:kGoodsDetailsSkusIsUseCoupon];
    [aCoder encodeDouble:_integral forKey:kGoodsDetailsSkusIntegral];
    [aCoder encodeObject:_taobaoNumIid forKey:kGoodsDetailsSkusTaobaoNumIid];
    [aCoder encodeObject:_status forKey:kGoodsDetailsSkusStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsSkus *copy = [[GoodsDetailsSkus alloc] init];
    
    if (copy) {

        copy.taobaoTitle = [self.taobaoTitle copyWithZone:zone];
        copy.style = [self.style copyWithZone:zone];
        copy.moneySymbol = [self.moneySymbol copyWithZone:zone];
        copy.quantity = [self.quantity copyWithZone:zone];
        copy.taobaoPrice = [self.taobaoPrice copyWithZone:zone];
        copy.sizeKey = [self.sizeKey copyWithZone:zone];
        copy.taobaoSellingPrice = [self.taobaoSellingPrice copyWithZone:zone];
        copy.skuId = [self.skuId copyWithZone:zone];
        copy.styleKey = [self.styleKey copyWithZone:zone];
        copy.taobaoPicUrl = [self.taobaoPicUrl copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.isUseCoupon = [self.isUseCoupon copyWithZone:zone];
        copy.integral = self.integral;
        copy.taobaoNumIid = [self.taobaoNumIid copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
