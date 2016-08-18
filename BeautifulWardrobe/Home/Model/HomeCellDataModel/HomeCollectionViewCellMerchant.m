//
//  HomeCollectionViewCellMerchant.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeCollectionViewCellMerchant.h"


NSString *const kHomeCollectionViewCellMerchantId = @"id";


@interface HomeCollectionViewCellMerchant ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeCollectionViewCellMerchant

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
            self.merchantIdentifier = [self objectOrNilForKey:kHomeCollectionViewCellMerchantId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.merchantIdentifier forKey:kHomeCollectionViewCellMerchantId];

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

    self.merchantIdentifier = [aDecoder decodeObjectForKey:kHomeCollectionViewCellMerchantId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_merchantIdentifier forKey:kHomeCollectionViewCellMerchantId];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeCollectionViewCellMerchant *copy = [[HomeCollectionViewCellMerchant alloc] init];
    
    if (copy) {

        copy.merchantIdentifier = [self.merchantIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
