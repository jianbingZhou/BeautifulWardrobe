//
//  HomeBodyView.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/11.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeBodyView : UIView

@property (nonatomic,strong) UIViewController *superVc;

-  (instancetype)initWithFrame:(CGRect)frame superViewController:(UIViewController *)superViewControllr;

- (void)UpDateAdsScrollViewContentWithData:(id)data;
@end
