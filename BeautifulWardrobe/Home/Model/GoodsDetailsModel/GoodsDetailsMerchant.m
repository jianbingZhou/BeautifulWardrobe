//
//  GoodsDetailsMerchant.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsMerchant.h"


NSString *const kGoodsDetailsMerchantId = @"id";


@interface GoodsDetailsMerchant ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsMerchant

@synthesize merchantIdentifier = _merchantIdentifier;


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
            self.merchantIdentifier = [self objectOrNilForKey:kGoodsDetailsMerchantId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.merchantIdentifier forKey:kGoodsDetailsMerchantId];

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

    self.merchantIdentifier = [aDecoder decodeObjectForKey:kGoodsDetailsMerchantId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_merchantIdentifier forKey:kGoodsDetailsMerchantId];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsMerchant *copy = [[GoodsDetailsMerchant alloc] init];
    
    if (copy) {

        copy.merchantIdentifier = [self.merchantIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
