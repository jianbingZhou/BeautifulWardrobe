//
//  GoodsDetailsPropsName.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsPropsName.h"


NSString *const kGoodsDetailsPropsNamePname = @"pname";
NSString *const kGoodsDetailsPropsNameVname = @"vname";


@interface GoodsDetailsPropsName ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsPropsName

@synthesize pname = _pname;
@synthesize vname = _vname;


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
            self.pname = [self objectOrNilForKey:kGoodsDetailsPropsNamePname fromDictionary:dict];
            self.vname = [self objectOrNilForKey:kGoodsDetailsPropsNameVname fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pname forKey:kGoodsDetailsPropsNamePname];
    [mutableDict setValue:self.vname forKey:kGoodsDetailsPropsNameVname];

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

    self.pname = [aDecoder decodeObjectForKey:kGoodsDetailsPropsNamePname];
    self.vname = [aDecoder decodeObjectForKey:kGoodsDetailsPropsNameVname];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pname forKey:kGoodsDetailsPropsNamePname];
    [aCoder encodeObject:_vname forKey:kGoodsDetailsPropsNameVname];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsPropsName *copy = [[GoodsDetailsPropsName alloc] init];
    
    if (copy) {

        copy.pname = [self.pname copyWithZone:zone];
        copy.vname = [self.vname copyWithZone:zone];
    }
    
    return copy;
}


@end
