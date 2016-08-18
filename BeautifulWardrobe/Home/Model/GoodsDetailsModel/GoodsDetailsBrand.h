//
//  GoodsDetailsBrand.h
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsBrand : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id taobaoSellerNick;
@property (nonatomic, strong) NSString *brandIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) id brandType;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, assign) double bindUserId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
