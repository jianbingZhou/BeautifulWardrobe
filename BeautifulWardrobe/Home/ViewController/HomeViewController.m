//
//  HomeViewController.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeNav.h"
#import "HomeBodyView.h"
#import "HomeAdsViewModel.h"
//#import "<#header#>"
@interface HomeViewController ()

@end

@implementation HomeViewController
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JBWhiteColor;
    [self setUpSubViews];
    
}

- (void)setUpSubViews {
    HomeNav *homeNav = [[HomeNav alloc] init];
    [self.view addSubview:homeNav];
    [homeNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.left.offset(0);
        make.right.offset(0);
        make.height.mas_equalTo(40);
    }];
    //__weak typeof(*&self)weakSelf = self;
    HomeBodyView *homeBodyView = [[HomeBodyView alloc] initWithFrame:CGRectZero superViewController:self];
    homeBodyView.frame = CGRectMake(0, 60, 425, 500);
    [self.view addSubview:homeBodyView];
    [homeBodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(homeNav.mas_bottom).offset(0);
        make.right.offset(0);
        make.left.offset(0);
        make.bottom.offset(-50);
    }];
    
//    //_Adsviewmodel 数据源
//    HomeAdsViewModel *adsViewModel = [HomeAdsViewModel new];
//    [adsViewModel setBlockWithSuccessCallBack:^(id value) {
//        
//        [homeBodyView UpDateAdsScrollViewContentWithData:value];
//    } WithErrorCallBack:^(id error) {
//        
//    }];
//    [adsViewModel RequestAdsData];

}

@end
