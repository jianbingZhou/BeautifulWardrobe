//
//  HomeBodyView.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/11.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "HomeBodyView.h"
#import "HomeAdsViewModel.h"
#import "HomeCellDataViewModel.h"
#import "DataModels.h"
#import "CellDataModels.h"
#import "HomeBgCollectionViewCell.h"
//#import "GoodsDetailsViewController.h"

static NSString *cellID = @"collectionViewCell";

@interface HomeBodyView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate> {
    UICollectionView *_bgCollectionView;
    UIButton *_jumpTopBtn;
    UIScrollView *_adsScrollView;
}

@property (nonatomic,strong) NSArray *cellDataArray;

@end

@implementation HomeBodyView


-  (instancetype)initWithFrame:(CGRect)frame superViewController:(UIViewController *)superViewControllr {
    if (self = [super initWithFrame:frame]) {
        self.superVc = superViewControllr;
        [self setUpSubViews];
    }
    return self;
}

- (NSArray *)cellDataArray {
    if (!_cellDataArray) {
        _cellDataArray = [NSArray array];
    }
    return _cellDataArray;
}

- (void)setUpSubViews {
    __weak typeof(self)WeakSelf = self;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _bgCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    _bgCollectionView.backgroundColor = [UIColor whiteColor];
    flowLayout.itemSize = CGSizeMake(kWIDTH/2.0 - 10, 300);
    [_bgCollectionView registerClass:[HomeBgCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    _bgCollectionView.delegate = self;
    _bgCollectionView.dataSource = self;
    [self addSubview:_bgCollectionView];
    [_bgCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    flowLayout.sectionInset = UIEdgeInsetsMake(260, 5, 60, 5);
    
    _jumpTopBtn = [UIButton new];
    [_jumpTopBtn setBackgroundImage:[UIImage imageNamed:@"go_top_btn.png"] forState:UIControlStateNormal];
    [_jumpTopBtn addTarget:self action:@selector(jumpTopBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _jumpTopBtn.hidden = YES;
    [self addSubview:_jumpTopBtn];
    [_jumpTopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(WeakSelf.mas_right).offset(5);
        make.bottom.equalTo(WeakSelf.mas_bottom).offset(-20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    _adsScrollView = [[UIScrollView alloc] init];
    _adsScrollView.delegate = self;
    _adsScrollView.bounces = NO;
    _adsScrollView.pagingEnabled = YES;
    //_adsScrollView.showsHorizontalScrollIndicator = NO;
    _adsScrollView.backgroundColor = [UIColor purpleColor];
    [self addSubview:_adsScrollView];
    [_adsScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(WeakSelf.mas_top).offset(0);
        make.left.offset(0);
        make.right.offset(0);
        make.height.mas_equalTo(250);
    }];
    //_Adsviewmodel 数据源
    HomeAdsViewModel *adsViewModel = [HomeAdsViewModel new];
    [adsViewModel setBlockWithSuccessCallBack:^(id value) {
        
        [WeakSelf UpDateAdsScrollViewContentWithData:value];
    } WithErrorCallBack:^(id error) {
        
    }];
    [adsViewModel RequestAdsData];
    //_adsScrollView 数据源
    HomeCellDataViewModel *homeCellDataViewModel = [[HomeCellDataViewModel alloc] init];
    [homeCellDataViewModel setBlockWithSuccessCallBack:^(id value) {
        HomeCollectionViewCellModel *homeCellDataModel = (HomeCollectionViewCellModel *)value;
        self.cellDataArray = homeCellDataModel.data.products;
        [_bgCollectionView reloadData];
        //MBProgressHUD HIDE
    } WithErrorCallBack:^(id error) {
        
    }];
    [homeCellDataViewModel requestCellData];
    //MBProgressHUD SHOW
}

#pragma mark - UpDateAdsScrollView Content
- (void)UpDateAdsScrollViewContentWithData:(id)data {
    HomeAdsModel *adsModel = (HomeAdsModel *)data;
    _adsScrollView.contentSize = CGSizeMake(kWIDTH*adsModel.data.count, 0);
    for (int i = 0; i < adsModel.data.count; i ++) {
        UIImageView *imageView = [UIImageView new];
        imageView.frame = CGRectMake(kWIDTH * i, 0, kWIDTH, 250);
        HomeAdsModelData *homeData = adsModel.data[i];
        NSURL *picUrl = [NSURL URLWithString:homeData.picUrl];
        [imageView sd_setImageWithURL:picUrl];
        [_adsScrollView addSubview:imageView];
    }
}

#pragma mark - jumpTopBtnClick
- (void)jumpTopBtnClick {
    [_bgCollectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    _jumpTopBtn.hidden = YES;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (scrollView == _bgCollectionView) {
        if (targetContentOffset->y > 0) {
            _jumpTopBtn.hidden = NO;
        }else if (targetContentOffset->y == 0) {
            _jumpTopBtn.hidden = YES;
        }
    }
}

#pragma mark - UICollectionViewDataSource & Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cellDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeBgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    HomeCollectionViewCellProducts *product = self.cellDataArray[indexPath.row];
    [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:product.taobaoPicUrl]];
    cell.priceLabel.text = product.taobaoSellingPrice;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
     HomeCollectionViewCellProducts *product = self.cellDataArray[indexPath.row];
    HomeCellDataViewModel *viewModel = [HomeCellDataViewModel new];
    [viewModel pushToGoodsDetailsVcWithTaoBaoID:product.taobaoNumIid WithSuperViewController:self.superVc];

}

@end
