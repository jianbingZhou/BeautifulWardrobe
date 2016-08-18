//
//  GoodsDetailsMobileDesc.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsMobileDesc.h"


NSString *const kGoodsDetailsMobileDescContent = @"content";
NSString *const kGoodsDetailsMobileDescContentType = @"content_type";


@interface GoodsDetailsMobileDesc ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsMobileDesc

@synthesize content = _content;
@synthesize contentType = _contentType;


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
            self.content = [self objectOrNilForKey:kGoodsDetailsMobileDescContent fromDictionary:dict];
            self.contentType = [[self objectOrNilForKey:kGoodsDetailsMobileDescContentType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.content forKey:kGoodsDetailsMobileDescContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contentType] forKey:kGoodsDetailsMobileDescContentType];

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

    self.content = [aDecoder decodeObjectForKey:kGoodsDetailsMobileDescContent];
    self.contentType = [aDecoder decodeDoubleForKey:kGoodsDetailsMobileDescContentType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_content forKey:kGoodsDetailsMobileDescContent];
    [aCoder encodeDouble:_contentType forKey:kGoodsDetailsMobileDescContentType];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsMobileDesc *copy = [[GoodsDetailsMobileDesc alloc] init];
    
    if (copy) {

        copy.content = [self.content copyWithZone:zone];
        copy.contentType = self.contentType;
    }
    
    return copy;
}


@end
