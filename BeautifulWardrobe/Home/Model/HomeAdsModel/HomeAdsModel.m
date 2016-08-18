//
//  HomeAdsModel.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeAdsModel.h"
#import "HomeAdsModelData.h"


NSString *const kHomeAdsModelData = @"data";
NSString *const kHomeAdsModelPublishStatus = @"publish_status";
NSString *const kHomeAdsModelMsg = @"msg";
NSString *const kHomeAdsModelRet = @"ret";


@interface HomeAdsModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAdsModel

@synthesize data = _data;
@synthesize publishStatus = _publishStatus;
@synthesize msg = _msg;
@synthesize ret = _ret;


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
    NSObject *receivedHomeData = [dict objectForKey:kHomeAdsModelData];
    NSMutableArray *parsedHomeData = [NSMutableArray array];
    if ([receivedHomeData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeData addObject:[HomeAdsModelData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeData isKindOfClass:[NSDictionary class]]) {
       [parsedHomeData addObject:[HomeAdsModelData modelObjectWithDictionary:(NSDictionary *)receivedHomeData]];
    }

    self.data = [NSArray arrayWithArray:parsedHomeData];
            self.publishStatus = [[self objectOrNilForKey:kHomeAdsModelPublishStatus fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kHomeAdsModelMsg fromDictionary:dict];
            self.ret = [[self objectOrNilForKey:kHomeAdsModelRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kHomeAdsModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishStatus] forKey:kHomeAdsModelPublishStatus];
    [mutableDict setValue:self.msg forKey:kHomeAdsModelMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kHomeAdsModelRet];

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

    self.data = [aDecoder decodeObjectForKey:kHomeAdsModelData];
    self.publishStatus = [aDecoder decodeDoubleForKey:kHomeAdsModelPublishStatus];
    self.msg = [aDecoder decodeObjectForKey:kHomeAdsModelMsg];
    self.ret = [aDecoder decodeDoubleForKey:kHomeAdsModelRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kHomeAdsModelData];
    [aCoder encodeDouble:_publishStatus forKey:kHomeAdsModelPublishStatus];
    [aCoder encodeObject:_msg forKey:kHomeAdsModelMsg];
    [aCoder encodeDouble:_ret forKey:kHomeAdsModelRet];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeAdsModel *copy = [[HomeAdsModel alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
        copy.publishStatus = self.publishStatus;
        copy.msg = [self.msg copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
