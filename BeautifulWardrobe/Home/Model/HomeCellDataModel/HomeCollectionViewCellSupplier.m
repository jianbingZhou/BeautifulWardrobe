//
//  HomeCollectionViewCellSupplier.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeCollectionViewCellSupplier.h"


NSString *const kHomeCollectionViewCellSupplierId = @"id";


@interface HomeCollectionViewCellSupplier ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeCollectionViewCellSupplier

@synthesize supplierIdentifier = _supplierIdentifier;


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
            self.supplierIdentifier = [self objectOrNilForKey:kHomeCollectionViewCellSupplierId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.supplierIdentifier forKey:kHomeCollectionViewCellSupplierId];

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

    self.supplierIdentifier = [aDecoder decodeObjectForKey:kHomeCollectionViewCellSupplierId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_supplierIdentifier forKey:kHomeCollectionViewCellSupplierId];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeCollectionViewCellSupplier *copy = [[HomeCollectionViewCellSupplier alloc] init];
    
    if (copy) {

        copy.supplierIdentifier = [self.supplierIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
