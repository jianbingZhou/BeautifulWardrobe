//
//  GoodsDetailsTableViewCell.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/16.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "GoodsDetailsTableViewCell.h"

@implementation GoodsDetailsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.bgImageView = [[JBImageView alloc] init];
                           // WithFrame:CGRectMake(0, 5, kWIDTH,300)];
        self.bgImageView.layer.borderColor=[UIColor blackColor].CGColor;
        self.bgImageView.layer.borderWidth=2;
        [self addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.offset(0);
        }];
    }
    return self;
}

@end
