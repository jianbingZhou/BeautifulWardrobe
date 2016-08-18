//
//  HomeData.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeAdsModelData.h"


NSString *const kHomeDataPicUrl = @"pic_url";
NSString *const kHomeDataUrl = @"url";


@interface HomeAdsModelData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAdsModelData

@synthesize picUrl = _picUrl;
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
            self.picUrl = [self objectOrNilForKey:kHomeDataPicUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHomeDataUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kHomeDataPicUrl];
    [mutableDict setValue:self.url forKey:kHomeDataUrl];

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

    self.picUrl = [aDecoder decodeObjectForKey:kHomeDataPicUrl];
    self.url = [aDecoder decodeObjectForKey:kHomeDataUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kHomeDataPicUrl];
    [aCoder encodeObject:_url forKey:kHomeDataUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeAdsModelData *copy = [[HomeAdsModelData alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
