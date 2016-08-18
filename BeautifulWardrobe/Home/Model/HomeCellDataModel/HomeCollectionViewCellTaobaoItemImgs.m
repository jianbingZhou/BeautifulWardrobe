//
//  HomeCollectionViewCellTaobaoItemImgs.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeCollectionViewCellTaobaoItemImgs.h"


NSString *const kHomeCollectionViewCellTaobaoItemImgsId = @"id";
NSString *const kHomeCollectionViewCellTaobaoItemImgsPosition = @"position";
NSString *const kHomeCollectionViewCellTaobaoItemImgsUrl = @"url";


@interface HomeCollectionViewCellTaobaoItemImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeCollectionViewCellTaobaoItemImgs

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
            self.taobaoItemImgsIdentifier = [[self objectOrNilForKey:kHomeCollectionViewCellTaobaoItemImgsId fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kHomeCollectionViewCellTaobaoItemImgsPosition fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kHomeCollectionViewCellTaobaoItemImgsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobaoItemImgsIdentifier] forKey:kHomeCollectionViewCellTaobaoItemImgsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kHomeCollectionViewCellTaobaoItemImgsPosition];
    [mutableDict setValue:self.url forKey:kHomeCollectionViewCellTaobaoItemImgsUrl];

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

    self.taobaoItemImgsIdentifier = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellTaobaoItemImgsId];
    self.position = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellTaobaoItemImgsPosition];
    self.url = [aDecoder decodeObjectForKey:kHomeCollectionViewCellTaobaoItemImgsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_taobaoItemImgsIdentifier forKey:kHomeCollectionViewCellTaobaoItemImgsId];
    [aCoder encodeDouble:_position forKey:kHomeCollectionViewCellTaobaoItemImgsPosition];
    [aCoder encodeObject:_url forKey:kHomeCollectionViewCellTaobaoItemImgsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeCollectionViewCellTaobaoItemImgs *copy = [[HomeCollectionViewCellTaobaoItemImgs alloc] init];
    
    if (copy) {

        copy.taobaoItemImgsIdentifier = self.taobaoItemImgsIdentifier;
        copy.position = self.position;
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
