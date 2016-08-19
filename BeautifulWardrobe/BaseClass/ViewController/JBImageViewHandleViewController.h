//
//  JBImageViewHandleViewController.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/19.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBImageViewHandleViewController : JBViewController
//图片数组
@property (nonatomic,strong) NSArray<UIImage *> *imagesArray;
//图片资源数组
@property (nonatomic,strong) NSArray<NSString *> *imagesUrlArray;
//只有一张图片
@property (nonatomic,strong) UIImage *oneImage;
@end
