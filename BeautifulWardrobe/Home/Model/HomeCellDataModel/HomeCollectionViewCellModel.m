//
//  HomeCollectionViewCellModel.m
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeCollectionViewCellModel.h"
#import "HomeCollectionViewCellData.h"


NSString *const kHomeCollectionViewCellModelRet = @"ret";
NSString *const kHomeCollectionViewCellModelMsg = @"msg";
NSString *const kHomeCollectionViewCellModelData = @"data";


@interface HomeCollectionViewCellModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeCollectionViewCellModel

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
            self.ret = [[self objectOrNilForKey:kHomeCollectionViewCellModelRet fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kHomeCollectionViewCellModelMsg fromDictionary:dict];
            self.data = [HomeCollectionViewCellData modelObjectWithDictionary:[dict objectForKey:kHomeCollectionViewCellModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kHomeCollectionViewCellModelRet];
    [mutableDict setValue:self.msg forKey:kHomeCollectionViewCellModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kHomeCollectionViewCellModelData];

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

    self.ret = [aDecoder decodeDoubleForKey:kHomeCollectionViewCellModelRet];
    self.msg = [aDecoder decodeObjectForKey:kHomeCollectionViewCellModelMsg];
    self.data = [aDecoder decodeObjectForKey:kHomeCollectionViewCellModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kHomeCollectionViewCellModelRet];
    [aCoder encodeObject:_msg forKey:kHomeCollectionViewCellModelMsg];
    [aCoder encodeObject:_data forKey:kHomeCollectionViewCellModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeCollectionViewCellModel *copy = [[HomeCollectionViewCellModel alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
