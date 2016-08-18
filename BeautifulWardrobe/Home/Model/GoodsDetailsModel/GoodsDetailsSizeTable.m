//
//  GoodsDetailsSizeTable.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsSizeTable.h"


NSString *const kGoodsDetailsSizeTableType = @"type";
NSString *const kGoodsDetailsSizeTableValues = @"values";


@interface GoodsDetailsSizeTable ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsSizeTable

@synthesize type = _type;
@synthesize values = _values;


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
            self.type = [[self objectOrNilForKey:kGoodsDetailsSizeTableType fromDictionary:dict] doubleValue];
            self.values = [self objectOrNilForKey:kGoodsDetailsSizeTableValues fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kGoodsDetailsSizeTableType];
    NSMutableArray *tempArrayForValues = [NSMutableArray array];
    for (NSObject *subArrayObject in self.values) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForValues addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForValues addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForValues] forKey:kGoodsDetailsSizeTableValues];

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

    self.type = [aDecoder decodeDoubleForKey:kGoodsDetailsSizeTableType];
    self.values = [aDecoder decodeObjectForKey:kGoodsDetailsSizeTableValues];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_type forKey:kGoodsDetailsSizeTableType];
    [aCoder encodeObject:_values forKey:kGoodsDetailsSizeTableValues];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsSizeTable *copy = [[GoodsDetailsSizeTable alloc] init];
    
    if (copy) {

        copy.type = self.type;
        copy.values = [self.values copyWithZone:zone];
    }
    
    return copy;
}


@end
