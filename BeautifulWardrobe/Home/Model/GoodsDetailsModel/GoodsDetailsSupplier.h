//
//  GoodsDetailsSupplier.h
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsSupplier : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *supplierIdentifier;
@property (nonatomic, assign) id nick;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
