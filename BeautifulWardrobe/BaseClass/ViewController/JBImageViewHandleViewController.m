//
//  JBImageViewHandleViewController.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/19.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBImageViewHandleViewController.h"

@interface JBImageViewHandleViewController ()<UIScrollViewDelegate> {
    UIImage *_currentImage;
    UIScrollView *_bgScrollView;
    NSMutableArray *_imagesArray;
}

@end

@implementation JBImageViewHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imagesArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self setUpSubViews];
}

- (NSArray *)imagesArray {
    if (!_imagesArray) {
        _imagesArray = [NSArray array];
    }
    return _imagesArray;
}



- (NSArray *)imagesUrlArray {
    if (!_imagesUrlArray) {
        _imagesUrlArray = [NSArray array];
    }
    return _imagesUrlArray;
}

- (void)setUpSubViews {
    UIView *nav = [[UIView alloc] init];
    nav.backgroundColor = JBRedColor;
    [self.view addSubview:nav];
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.height.equalTo(@40);
        make.left.right.equalTo(self.view);
    }];
    
    UIButton *saveImageBtn = [UIButton new];
    [saveImageBtn setBackgroundImage:[UIImage imageNamed:@"商品详情页前进按钮.png"] forState:0];
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
    saveImageBtn.transform = transform;
    [saveImageBtn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:saveImageBtn];
    [saveImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(0);
        make.width.height.equalTo(@40);
    }];
    
    UIButton *popBackBtn = [UIButton new];
    [popBackBtn setBackgroundImage:[UIImage imageNamed:@"商品详情页前进按钮.png"] forState:UIControlStateNormal];
    [nav addSubview:popBackBtn];
    popBackBtn.transform = CGAffineTransformMakeRotation(M_PI);
    [popBackBtn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [popBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.width.height.equalTo(@40);
        make.left.offset(0);
    }];
    
    _bgScrollView = [[UIScrollView alloc] init];
    _bgScrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_bgScrollView];
    _bgScrollView.delegate = self;
    
    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(61);
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
    }];
    
    if (_oneImage) {
        _bgScrollView.contentSize = CGSizeMake(kWIDTH, 0);
        UIImageView *imageView = [UIImageView new];
        UIImage *image = _oneImage;
        imageView.image = image;
        [_bgScrollView addSubview:imageView];
        imageView.frame = CGRectMake(0, 0, kWIDTH, kHEIGHT - 60);
        return;
    }
   
    if (self.imagesArray.count > 0) {
        
    }else if (self.imagesUrlArray.count > 0) {
            _bgScrollView.contentSize = CGSizeMake(self.imagesUrlArray.count * kWIDTH, 0);
        for (int i = 0; i < self.imagesUrlArray.count; i ++) {
            UIImageView *imageView = [UIImageView new];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imagesUrlArray[i]]]];
            [_imagesArray addObject:image];
            imageView.image = image;
            [_bgScrollView addSubview:imageView];
            imageView.frame = CGRectMake(i*kWIDTH, 0, kWIDTH, kHEIGHT - 60);
            if (i == 0) {
                _currentImage = image;
            }
        }

    }else {
        return;
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = scrollView.contentOffset.x/kWIDTH;
    _currentImage = _imagesArray[index];
}

- (void)save:(UIButton *)btn {
    UIImageWriteToSavedPhotosAlbum(_currentImage, self, @selector(image: didFinishSavingWithError: contextInfo:), nil);
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已存入手机相册" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil ];
        [alert show];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil ];
        [alert show];
    }

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
