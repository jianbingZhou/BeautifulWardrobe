//
//  GoodsDetailsSizeTable.h
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsSizeTable : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSArray *values;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
