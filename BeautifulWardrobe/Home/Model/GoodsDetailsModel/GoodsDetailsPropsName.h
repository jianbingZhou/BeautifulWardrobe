//
//  GoodsDetailsPropsName.h
//
//  Created by   on 16/8/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsPropsName : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pname;
@property (nonatomic, strong) NSString *vname;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
