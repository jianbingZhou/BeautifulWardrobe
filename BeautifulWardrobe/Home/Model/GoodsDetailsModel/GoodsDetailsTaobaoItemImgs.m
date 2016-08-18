//
//  GoodsDetailsTaobaoItemImgs.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsTaobaoItemImgs.h"


NSString *const kGoodsDetailsTaobaoItemImgsId = @"id";
NSString *const kGoodsDetailsTaobaoItemImgsPosition = @"position";
NSString *const kGoodsDetailsTaobaoItemImgsUrl = @"url";


@interface GoodsDetailsTaobaoItemImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsTaobaoItemImgs

@synthesize taobaoItemImgsIdentifier = _taobaoItemImgsIdentifier;
@synthesize position = _position;
@synthesize url = _url;


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
            self.taobaoItemImgsIdentifier = [[self objectOrNilForKey:kGoodsDetailsTaobaoItemImgsId fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kGoodsDetailsTaobaoItemImgsPosition fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kGoodsDetailsTaobaoItemImgsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobaoItemImgsIdentifier] forKey:kGoodsDetailsTaobaoItemImgsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kGoodsDetailsTaobaoItemImgsPosition];
    [mutableDict setValue:self.url forKey:kGoodsDetailsTaobaoItemImgsUrl];

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

    self.taobaoItemImgsIdentifier = [aDecoder decodeDoubleForKey:kGoodsDetailsTaobaoItemImgsId];
    self.position = [aDecoder decodeDoubleForKey:kGoodsDetailsTaobaoItemImgsPosition];
    self.url = [aDecoder decodeObjectForKey:kGoodsDetailsTaobaoItemImgsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_taobaoItemImgsIdentifier forKey:kGoodsDetailsTaobaoItemImgsId];
    [aCoder encodeDouble:_position forKey:kGoodsDetailsTaobaoItemImgsPosition];
    [aCoder encodeObject:_url forKey:kGoodsDetailsTaobaoItemImgsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsTaobaoItemImgs *copy = [[GoodsDetailsTaobaoItemImgs alloc] init];
    
    if (copy) {

        copy.taobaoItemImgsIdentifier = self.taobaoItemImgsIdentifier;
        copy.position = self.position;
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
