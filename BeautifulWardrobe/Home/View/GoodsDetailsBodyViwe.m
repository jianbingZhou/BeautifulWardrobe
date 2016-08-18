//
//  GoodsDetailsBodyViwe.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/15.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "GoodsDetailsBodyViwe.h"
#import "GoodsDetailsDataModels.h"
#import "GoodsDetailsTableViewCell.h"
@interface GoodsDetailsBodyViwe ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate> {
    //NSMutableArray *dataArray;
    GoodsDetailsbodyViewDataModel *_dataModel;
    NSMutableArray *_heightArray;
    NSMutableArray *_imageArray;
}

@end

@implementation GoodsDetailsBodyViwe

//刷新View
- (void)updateContentsWithModle:(GoodsDetailsbodyViewDataModel *)model {
    self.dataArray = model.data.mobileDesc;
    _dataModel = model;
    [self.bgTableView setTableHeaderView:[self tableHeaderView]];
    //[self getCellHeightArray];
    [self.bgTableView reloadData];
}

/*
- (void)getCellHeightArray {
     _heightArray = [[NSMutableArray alloc] initWithCapacity:0];
   // _imageArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < _dataModel.data.mobileDesc.count; i ++) {
        GoodsDetailsMobileDesc *desc = _dataModel.data.mobileDesc[i];
        [[UIImageView alloc] sd_setImageWithURL:[NSURL URLWithString:desc.content] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //[_imageArray addObject:image];
            CGFloat height = image.size.height * kWIDTH/image.size.width;
            [_heightArray addObject:[NSString stringWithFormat:@"%f",height]];
        }];
    }
}*/


- (instancetype)init {
    if (self = [super init]) {
        [self createTableView];
    }
    return self;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (void)createTableView {
        __weak typeof(*&self)weakSelf = self;
    self.backgroundColor = JBWhiteColor;
    
    //tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 300;
    [tableView registerClass:[GoodsDetailsTableViewCell class] forCellReuseIdentifier:@"goodsDetailsID"];
    self.bgTableView = tableView;
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(nav.mas_bottom).offset(0);
        make.top.offset(5);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(0);
    }];
}

//表头
- (UIView *)tableHeaderView {
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 385)];
    tableHeaderView.backgroundColor = JBWhiteColor;
     [self createHeaderScrollViewWithView:tableHeaderView];
    return tableHeaderView;
}

#pragma mark - UITableViewDataSource &UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoodsDetailsMobileDesc *desc = _dataModel.data.mobileDesc[indexPath.row];
    if (desc.height == 0) {
        return 300;
    }else {
        if (desc.height > 0) {
            return desc.height + 10;
        }else {
            return 300;
        }
    }
//    if (desc.height == 0) {
//        NSURL *url = [NSURL URLWithString:desc.content];
//        CGSize imageSize = [NSURL getImageSizeWithURL:url];
//        desc.height = imageSize.height * kWIDTH/imageSize.width;
//        
//        
//        return desc.height;
//    }else {
//        return desc.height + 10;
//    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoodsDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goodsDetailsID" forIndexPath:indexPath];
    GoodsDetailsMobileDesc *desc = _dataModel.data.mobileDesc[indexPath.row];
    NSString *urlString = desc.content;
     //cell.bgImageView.frame=CGRectMake(0, 5, kWIDTH, desc.height);
    [cell.bgImageView sd_setImageWithURL:[NSURL URLWithString:urlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (desc.height == 0) {
            
            if (image.size.width>0) {
                
                desc.height = image.size.height*kWIDTH/image.size.width;
                
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
        }
        
        cell.bgImageView.frame=CGRectMake(0, 5, kWIDTH, desc.height);
    }];
    cell.bgImageView.frame=CGRectMake(0, 5, kWIDTH, desc.height);

    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (_dataModel.data.sizeTable.values) {
        return _dataModel.data.sizeTable.values.count * 60 +10;
    }
    return 0.001;
}

//区头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //tableHeaderView
    UIView *sectionHeaderView = [[UIView alloc] init];
    //sectionHeaderView.backgroundColor = JBWhiteColor;
    [self createSizeTableWithView:sectionHeaderView];
    sectionHeaderView.layer.borderColor = JBWhiteColor.CGColor;
    sectionHeaderView.layer.borderWidth = 2;
    return sectionHeaderView;
}

- (void)createSizeTableWithView:(UIView *)view {
    if (!_dataModel.data.sizeTable.values) {
        
        
        return;
    }else {
        for (int j = 0; j < _dataModel.data.sizeTable.values.count; j ++) {
            NSArray *array = _dataModel.data.sizeTable.values[j];
            
            UILabel *lastLabel = nil;
            for (int k = 0; k < array.count; k ++) {
                UILabel *label = [UILabel new];
                label.text = array[k];
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont systemFontOfSize:14];
//                label.layer.borderWidth = 1;
//                label.layer.borderColor = JBBlackColor.CGColor;
                [view addSubview:label];
                
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    if (k == 0) {
                        make.left.equalTo(view.mas_left).offset(10);
                    }else {
                        make.left.equalTo(lastLabel.mas_right).offset(10);
                        make.width.equalTo(lastLabel.mas_width);
                    }
                    make.top.offset(j*60 + 10);
                    make.height.mas_equalTo(50);
                    if (k == array.count-1) {
                        make.right.equalTo(view.mas_right).offset(-10);
                    }
                    
                }];
                label.backgroundColor = JBWhiteColor;
                lastLabel = label;
            }
        }

    }

}

- (void)createHeaderScrollViewWithView:(UIView *)view {
    SDCycleScrollView *scrollView = [[SDCycleScrollView alloc] init];
    scrollView.delegate = self;
    [view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(0);
        make.left.equalTo(view.mas_left).offset(0);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.mas_equalTo(300);
    }];
    NSMutableArray *urlStringArray = [[NSMutableArray alloc] initWithCapacity:_dataModel.data.taobaoItemImgs.count];
    
    for (GoodsDetailsTaobaoItemImgs *imgModel in _dataModel.data.taobaoItemImgs) {
        NSString *urlString = imgModel.url;
        [urlStringArray addObject:urlString];
    }
    scrollView.imageURLStringsGroup = urlStringArray;
    //titleLabel
    UILabel *titleLabel = [UILabel new];
    titleLabel.backgroundColor = JBWhiteColor;
    titleLabel.text = _dataModel.data.taobaoTitle;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    [view addSubview:titleLabel];
    CGSize size = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_bottom).offset(0);
        make.width.offset(size.width);
        make.height.offset(20);
        make.centerX.equalTo(view);
    }];
    //service four btn
     UIImageView *lastImageView;
    for (int i  = 0; i < _dataModel.data.service.count; i ++) {
        GoodsDetailsService *serVice = _dataModel.data.service[i];
        NSString *urlString = serVice.picUrl;
        UIImageView *imgView = [UIImageView new];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imgView];
//        [imgView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:urlString] placeholderImage:nil options:1 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            
//        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            
//        }];
        [imgView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(titleLabel.mas_bottom).offset(5);
            //make.top.offset(350);
            if (i == 0) {
                make.left.equalTo(view.mas_left).offset(10);
            }else {
                make.left.equalTo(lastImageView.mas_right).offset(10);
                make.width.equalTo(lastImageView.mas_width);
            }
            make.height.mas_equalTo(60);
            if (i == _dataModel.data.service.count - 1) {
                make.right.equalTo(view.mas_right).offset(-10);
            }
            
        }];
        lastImageView = imgView;
    }
}
#pragma mark - SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}

@end
