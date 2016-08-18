//
//  HomeCollectionViewCellSupplier.h
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeCollectionViewCellSupplier : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *supplierIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
