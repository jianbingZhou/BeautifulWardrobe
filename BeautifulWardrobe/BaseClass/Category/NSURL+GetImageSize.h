//
//  NSURL+GetImageSize.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/17.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (GetImageSize)
// 根据图片url获取图片尺寸
+(CGSize)getImageSizeWithURL:(id)imageURL;
@end
