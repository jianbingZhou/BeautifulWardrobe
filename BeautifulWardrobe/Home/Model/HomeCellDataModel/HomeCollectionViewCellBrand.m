//
//  HomeCollectionViewCellBrand.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeCollectionViewCellBrand.h"


NSString *const kHomeCollectionViewCellBrandId = @"id";
NSString *const kHomeCollectionViewCellBrandTitle = @"title";
NSString *const kHomeCollectionViewCellBrandLogoUrl = @"logo_url";


@interface HomeCollectionViewCellBrand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeCollectionViewCellBrand

@synthesize brandIdentifier = _brandIdentifier;
@synthesize title = _title;
@synthesize logoUrl = _logoUrl;


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
            self.brandIdentifier = [self objectOrNilForKey:kHomeCollectionViewCellBrandId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHomeCollectionViewCellBrandTitle fromDictionary:dict];
            self.logoUrl = [self objectOrNilForKey:kHomeCollectionViewCellBrandLogoUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brandIdentifier forKey:kHomeCollectionViewCellBrandId];
    [mutableDict setValue:self.title forKey:kHomeCollectionViewCellBrandTitle];
    [mutableDict setValue:self.logoUrl forKey:kHomeCollectionViewCellBrandLogoUrl];

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

    self.brandIdentifier = [aDecoder decodeObjectForKey:kHomeCollectionViewCellBrandId];
    self.title = [aDecoder decodeObjectForKey:kHomeCollectionViewCellBrandTitle];
    self.logoUrl = [aDecoder decodeObjectForKey:kHomeCollectionViewCellBrandLogoUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brandIdentifier forKey:kHomeCollectionViewCellBrandId];
    [aCoder encodeObject:_title forKey:kHomeCollectionViewCellBrandTitle];
    [aCoder encodeObject:_logoUrl forKey:kHomeCollectionViewCellBrandLogoUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeCollectionViewCellBrand *copy = [[HomeCollectionViewCellBrand alloc] init];
    
    if (copy) {

        copy.brandIdentifier = [self.brandIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.logoUrl = [self.logoUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
