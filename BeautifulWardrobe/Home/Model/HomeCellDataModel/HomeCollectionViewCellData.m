//
//  HomeCollectionViewCellData.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeCollectionViewCellData.h"
#import "HomeCollectionViewCellProducts.h"


NSString *const kHomeCollectionViewCellDataPreviousCursor = @"previous_cursor";
NSString *const kHomeCollectionViewCellDataNextCursor = @"next_cursor";
NSString *const kHomeCollectionViewCellDataProducts = @"products";


@interface HomeCollectionViewCellData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeCollectionViewCellData

@synthesize previousCursor = _previousCursor;
@synthesize nextCursor = _nextCursor;
@synthesize products = _products;


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
            self.previousCursor = [self objectOrNilForKey:kHomeCollectionViewCellDataPreviousCursor fromDictionary:dict];
            self.nextCursor = [self objectOrNilForKey:kHomeCollectionViewCellDataNextCursor fromDictionary:dict];
    NSObject *receivedHomeCollectionViewCellProducts = [dict objectForKey:kHomeCollectionViewCellDataProducts];
    NSMutableArray *parsedHomeCollectionViewCellProducts = [NSMutableArray array];
    if ([receivedHomeCollectionViewCellProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeCollectionViewCellProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeCollectionViewCellProducts addObject:[HomeCollectionViewCellProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeCollectionViewCellProducts isKindOfClass:[NSDictionary class]]) {
       [parsedHomeCollectionViewCellProducts addObject:[HomeCollectionViewCellProducts modelObjectWithDictionary:(NSDictionary *)receivedHomeCollectionViewCellProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedHomeCollectionViewCellProducts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.previousCursor forKey:kHomeCollectionViewCellDataPreviousCursor];
    [mutableDict setValue:self.nextCursor forKey:kHomeCollectionViewCellDataNextCursor];
    NSMutableArray *tempArrayForProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.products) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kHomeCollectionViewCellDataProducts];

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

    self.previousCursor = [aDecoder decodeObjectForKey:kHomeCollectionViewCellDataPreviousCursor];
    self.nextCursor = [aDecoder decodeObjectForKey:kHomeCollectionViewCellDataNextCursor];
    self.products = [aDecoder decodeObjectForKey:kHomeCollectionViewCellDataProducts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_previousCursor forKey:kHomeCollectionViewCellDataPreviousCursor];
    [aCoder encodeObject:_nextCursor forKey:kHomeCollectionViewCellDataNextCursor];
    [aCoder encodeObject:_products forKey:kHomeCollectionViewCellDataProducts];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeCollectionViewCellData *copy = [[HomeCollectionViewCellData alloc] init];
    
    if (copy) {

        copy.previousCursor = [self.previousCursor copyWithZone:zone];
        copy.nextCursor = [self.nextCursor copyWithZone:zone];
        copy.products = [self.products copyWithZone:zone];
    }
    
    return copy;
}


@end
