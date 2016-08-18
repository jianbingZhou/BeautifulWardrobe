//
//  GoodsDetailsBrand.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsBrand.h"


NSString *const kGoodsDetailsBrandTaobaoSellerNick = @"taobao_seller_nick";
NSString *const kGoodsDetailsBrandId = @"id";
NSString *const kGoodsDetailsBrandTitle = @"title";
NSString *const kGoodsDetailsBrandBrandType = @"brand_type";
NSString *const kGoodsDetailsBrandLogoUrl = @"logo_url";
NSString *const kGoodsDetailsBrandBindUserId = @"bind_user_id";


@interface GoodsDetailsBrand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsBrand

@synthesize taobaoSellerNick = _taobaoSellerNick;
@synthesize brandIdentifier = _brandIdentifier;
@synthesize title = _title;
@synthesize brandType = _brandType;
@synthesize logoUrl = _logoUrl;
@synthesize bindUserId = _bindUserId;


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
            self.taobaoSellerNick = [self objectOrNilForKey:kGoodsDetailsBrandTaobaoSellerNick fromDictionary:dict];
            self.brandIdentifier = [self objectOrNilForKey:kGoodsDetailsBrandId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kGoodsDetailsBrandTitle fromDictionary:dict];
            self.brandType = [self objectOrNilForKey:kGoodsDetailsBrandBrandType fromDictionary:dict];
            self.logoUrl = [self objectOrNilForKey:kGoodsDetailsBrandLogoUrl fromDictionary:dict];
            self.bindUserId = [[self objectOrNilForKey:kGoodsDetailsBrandBindUserId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.taobaoSellerNick forKey:kGoodsDetailsBrandTaobaoSellerNick];
    [mutableDict setValue:self.brandIdentifier forKey:kGoodsDetailsBrandId];
    [mutableDict setValue:self.title forKey:kGoodsDetailsBrandTitle];
    [mutableDict setValue:self.brandType forKey:kGoodsDetailsBrandBrandType];
    [mutableDict setValue:self.logoUrl forKey:kGoodsDetailsBrandLogoUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bindUserId] forKey:kGoodsDetailsBrandBindUserId];

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

    self.taobaoSellerNick = [aDecoder decodeObjectForKey:kGoodsDetailsBrandTaobaoSellerNick];
    self.brandIdentifier = [aDecoder decodeObjectForKey:kGoodsDetailsBrandId];
    self.title = [aDecoder decodeObjectForKey:kGoodsDetailsBrandTitle];
    self.brandType = [aDecoder decodeObjectForKey:kGoodsDetailsBrandBrandType];
    self.logoUrl = [aDecoder decodeObjectForKey:kGoodsDetailsBrandLogoUrl];
    self.bindUserId = [aDecoder decodeDoubleForKey:kGoodsDetailsBrandBindUserId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_taobaoSellerNick forKey:kGoodsDetailsBrandTaobaoSellerNick];
    [aCoder encodeObject:_brandIdentifier forKey:kGoodsDetailsBrandId];
    [aCoder encodeObject:_title forKey:kGoodsDetailsBrandTitle];
    [aCoder encodeObject:_brandType forKey:kGoodsDetailsBrandBrandType];
    [aCoder encodeObject:_logoUrl forKey:kGoodsDetailsBrandLogoUrl];
    [aCoder encodeDouble:_bindUserId forKey:kGoodsDetailsBrandBindUserId];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsBrand *copy = [[GoodsDetailsBrand alloc] init];
    
    if (copy) {

        copy.taobaoSellerNick = [self.taobaoSellerNick copyWithZone:zone];
        copy.brandIdentifier = [self.brandIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.brandType = [self.brandType copyWithZone:zone];
        copy.logoUrl = [self.logoUrl copyWithZone:zone];
        copy.bindUserId = self.bindUserId;
    }
    
    return copy;
}


@end
