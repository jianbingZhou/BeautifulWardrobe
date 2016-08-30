//
//  JBImageView.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/19.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBImageView.h"
#import "AppDelegate.h"
#import "JBImageViewHandleViewController.h"
#import "GoodsDetailsDataModels.h"

@implementation JBImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    JBImageView *imageView;
    if ([tap.view isKindOfClass:[JBImageView class]]) {
        imageView  = (JBImageView *)tap.view;
    }
    
   UIViewController *currentVc = [self getCurrentViewController];
    JBImageViewHandleViewController *imageViewHandleVc = [JBImageViewHandleViewController new];
    if ([currentVc isKindOfClass:[GoodsDetailsViewController class]]) {
        GoodsDetailsViewController *goodsDetailsVc = (GoodsDetailsViewController *)currentVc;
        NSMutableArray *urlStringArray = [[NSMutableArray alloc] initWithCapacity:goodsDetailsVc.dataModel.data.mobileDesc.count];
        for (GoodsDetailsMobileDesc *desc in goodsDetailsVc.dataModel.data.mobileDesc) {
            if (desc) {
                [urlStringArray addObject:desc.content];
            }
        }
        imageViewHandleVc.imagesUrlArray = urlStringArray;
        
        
    }
    if (imageView) {
        imageViewHandleVc.oneImage = imageView.image;
    }
    [currentVc.navigationController pushViewController:imageViewHandleVc animated:YES];
}

/** 获取当前View（self）的控制器对象 */
- (UIViewController *)getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}

//获取当前屏幕显示的viewcontroller 不需要知道view
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
