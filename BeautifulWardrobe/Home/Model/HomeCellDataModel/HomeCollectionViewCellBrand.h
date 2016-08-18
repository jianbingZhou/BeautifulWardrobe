//
//  HomeCollectionViewCellBrand.h
//
//  Created by   on 16/8/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeCollectionViewCellBrand : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *brandIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *logoUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
