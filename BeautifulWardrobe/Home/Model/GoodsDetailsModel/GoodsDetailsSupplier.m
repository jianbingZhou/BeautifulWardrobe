//
//  GoodsDetailsSupplier.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsSupplier.h"


NSString *const kGoodsDetailsSupplierId = @"id";
NSString *const kGoodsDetailsSupplierNick = @"nick";


@interface GoodsDetailsSupplier ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsSupplier

@synthesize supplierIdentifier = _supplierIdentifier;
@synthesize nick = _nick;


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
            self.supplierIdentifier = [self objectOrNilForKey:kGoodsDetailsSupplierId fromDictionary:dict];
            self.nick = [self objectOrNilForKey:kGoodsDetailsSupplierNick fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.supplierIdentifier forKey:kGoodsDetailsSupplierId];
    [mutableDict setValue:self.nick forKey:kGoodsDetailsSupplierNick];

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

    self.supplierIdentifier = [aDecoder decodeObjectForKey:kGoodsDetailsSupplierId];
    self.nick = [aDecoder decodeObjectForKey:kGoodsDetailsSupplierNick];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_supplierIdentifier forKey:kGoodsDetailsSupplierId];
    [aCoder encodeObject:_nick forKey:kGoodsDetailsSupplierNick];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsSupplier *copy = [[GoodsDetailsSupplier alloc] init];
    
    if (copy) {

        copy.supplierIdentifier = [self.supplierIdentifier copyWithZone:zone];
        copy.nick = [self.nick copyWithZone:zone];
    }
    
    return copy;
}


@end
