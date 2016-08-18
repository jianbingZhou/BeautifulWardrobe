//
//  GoodsDetailsbodyViewDataModel.m
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsbodyViewDataModel.h"
#import "GoodsDetailsData.h"


NSString *const kGoodsDetailsbodyViewDataModelRet = @"ret";
NSString *const kGoodsDetailsbodyViewDataModelMsg = @"msg";
NSString *const kGoodsDetailsbodyViewDataModelData = @"data";


@interface GoodsDetailsbodyViewDataModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsbodyViewDataModel

@synthesize ret = _ret;
@synthesize msg = _msg;
@synthesize data = _data;


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
            self.ret = [[self objectOrNilForKey:kGoodsDetailsbodyViewDataModelRet fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kGoodsDetailsbodyViewDataModelMsg fromDictionary:dict];
            self.data = [GoodsDetailsData modelObjectWithDictionary:[dict objectForKey:kGoodsDetailsbodyViewDataModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kGoodsDetailsbodyViewDataModelRet];
    [mutableDict setValue:self.msg forKey:kGoodsDetailsbodyViewDataModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kGoodsDetailsbodyViewDataModelData];

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

    self.ret = [aDecoder decodeDoubleForKey:kGoodsDetailsbodyViewDataModelRet];
    self.msg = [aDecoder decodeObjectForKey:kGoodsDetailsbodyViewDataModelMsg];
    self.data = [aDecoder decodeObjectForKey:kGoodsDetailsbodyViewDataModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kGoodsDetailsbodyViewDataModelRet];
    [aCoder encodeObject:_msg forKey:kGoodsDetailsbodyViewDataModelMsg];
    [aCoder encodeObject:_data forKey:kGoodsDetailsbodyViewDataModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    GoodsDetailsbodyViewDataModel *copy = [[GoodsDetailsbodyViewDataModel alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
