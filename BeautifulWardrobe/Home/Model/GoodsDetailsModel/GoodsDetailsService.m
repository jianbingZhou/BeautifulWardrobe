//
//  GoodsDetailsService.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsService.h"


NSString *const kGoodsDetailsServiceTitle = @"title";
NSString *const kGoodsDetailsServicePicUrl = @"pic_url";


@interface GoodsDetailsService ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsService

@synthesize title = _title;
@synthesize picUrl = _picUrl;


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
            self.title = [self objectOrNilForKey:kGoodsDetailsServiceTitle fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kGoodsDetailsServicePicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kGoodsDetailsServiceTitle];
    [mutableDict setValue:self.picUrl forKey:kGoodsDetailsServicePicUrl];

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

    self.title = [aDecoder decodeObjectForKey:kGoodsDetailsServiceTitle];
    self.picUrl = [aDecoder decodeObjectForKey:kGoodsDetailsServicePicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kGoodsDetailsServiceTitle];
    [aCoder encodeObject:_picUrl forKey:kGoodsDetailsServicePicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsService *copy = [[GoodsDetailsService alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
