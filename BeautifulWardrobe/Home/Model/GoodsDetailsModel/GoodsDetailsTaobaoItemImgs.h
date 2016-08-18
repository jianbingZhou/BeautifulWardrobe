//
//  GoodsDetailsTaobaoItemImgs.h
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsTaobaoItemImgs : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double taobaoItemImgsIdentifier;
@property (nonatomic, assign) double position;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
