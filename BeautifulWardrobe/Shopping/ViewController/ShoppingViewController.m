//
//  ShoppingViewController.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ShoppingViewController.h"
#import "ShoppingViewControllerTableViewCell.h"
#import "ShoppingViewControllerCalculateView.h"

@interface ShoppingViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_myTableView;
    ShoppingViewControllerCalculateView *_shoppingViewControllerCalculateView;
}

@end

@implementation ShoppingViewController
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"购物车";
    CGRect rect = CGRectMake(0, 60, kWIDTH, kHEIGHT - 104);
    _myTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    [_myTableView registerClass:[ShoppingViewControllerTableViewCell class] forCellReuseIdentifier:@"shoppingViewCell"];
    [self.view addSubview:_myTableView];
    
    _shoppingViewControllerCalculateView = [[ShoppingViewControllerCalculateView alloc] init];
    _shoppingViewControllerCalculateView.calculateViewCallBack = ^(UIButton *btn){
        JBLOG(@"*****回调");
    };
    [self.view addSubview:_shoppingViewControllerCalculateView];
    [_shoppingViewControllerCalculateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.offset(-44);
        make.height.mas_equalTo(40);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataSourceArray = [FMDBManager getCollectData];;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSourceArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"商品列表 一";
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingViewControllerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shoppingViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[ShoppingViewControllerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shoppingViewCell"];
    }
    DataBaseModelCollectionGoods *goods = self.dataSourceArray[indexPath.row];
    cell.dataBaseModelCollectionGoods = goods;
    return cell;
}


@end
