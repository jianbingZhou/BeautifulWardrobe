//
//  GoodsDetailsViewController.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/15.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "GoodsDetailsViewController.h"
#import "GoodsDetailsBodyViwe.h"
#import "GoodsDetailsBodyViewCellViewModel.h"
#import "GoodsDetailsDataModels.h"
#import "JBChoseGoods.h"

@interface GoodsDetailsViewController () {
   // NSArray *_dataArray;
    UILabel *_goodsNumberLabel;
    NSMutableArray *_sizeArray;
    NSMutableArray *_colorArray;
    NSDictionary *_stockarr;
    CGFloat  _quantity;
    
    UIImageView *_animationImageView;
    CGFloat navOldheight;
    GoodsDetailsBodyViwe *bodyView;
    CGPoint bodyViewOldCenter;
    UIView *nav;
}
@property (nonatomic, strong)JBChoseGoodsView *choseGoodsView;
@end

@implementation GoodsDetailsViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JBWhiteColor;
    [self setUpSubViews];
    _animationImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ani_addShopCart.png"]];
    _animationImageView.frame=CGRectMake(-1, -1, 1, 1);
    [self.view addSubview:_animationImageView];
}

- (void)setUpSubViews {
    //nav
    nav = [UIView new];
    nav.backgroundColor = [UIColor whiteColor];
    nav.userInteractionEnabled = YES;
    [self.view addSubview:nav];
    nav.backgroundColor = JBWhiteColor;
   // __weak typeof(self)weakSelf = self;
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(40);
    }];
    UILabel *titleLabel = [UILabel new];
    titleLabel.backgroundColor = JBWhiteColor;
    titleLabel.text = @"商品详情";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [nav addSubview:titleLabel];
    CGSize titleLableSize = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(0);
        make.bottom.equalTo(nav.mas_bottom).offset(0);
        make.width.mas_equalTo(titleLableSize.width);
        make.centerX.equalTo(nav);
    }];
    //navOldheight = nav.frame.size.height;
    
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"closead.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.left.equalTo(nav.mas_left).offset(5);
        make.top.equalTo(nav.mas_top).offset(0);
    }];
    
    UIButton *shoppingCarBtn = [UIButton new];
    [shoppingCarBtn setBackgroundImage:[UIImage imageNamed:@"img_recment_red.png"] forState:UIControlStateNormal];
    [shoppingCarBtn addTarget:self action:@selector(shoppingCarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:shoppingCarBtn];
    [shoppingCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(nav.mas_right).offset(- 5);
        make.width.offset(40);
        make.height.offset(40);
        make.top.equalTo(nav.mas_top).offset(0);
    }];
    
    _goodsNumberLabel=[[UILabel alloc]init];
    _goodsNumberLabel.backgroundColor=[UIColor yellowColor];
    _goodsNumberLabel.clipsToBounds=YES;
    _goodsNumberLabel.layer.cornerRadius=10;
    _goodsNumberLabel.text = [FMDBManager getColletCounts];
    _goodsNumberLabel.font=[UIFont systemFontOfSize:10];
    _goodsNumberLabel.textAlignment=NSTextAlignmentCenter;
    [nav addSubview:_goodsNumberLabel];
    [_goodsNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(0);
        make.height.offset(20);
        make.width.offset(20);
        make.right.offset(- 5);
    }];
    
     bodyView = [[GoodsDetailsBodyViwe alloc] init];
     //bodyView.frame = CGRectMake(0, 60, _bgView.frame.size.width, _bgView.frame.size.height);
    [self.view addSubview:bodyView];
    [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
    [self creatBarView];
   
    //请求数据
    GoodsDetailsBodyViewCellViewModel *viewModel = [GoodsDetailsBodyViewCellViewModel new];
    [viewModel setBlockWithSuccessCallBack:^(id value) {
        GoodsDetailsbodyViewDataModel *dataModel = (GoodsDetailsbodyViewDataModel *)value;
        _dataModel = dataModel;
        [self getSizeAndColorArray:dataModel];
        [bodyView updateContentsWithModle:dataModel];
        
    } WithErrorCallBack:^(id error) {
        
        JBLOG(@"请求数据失败");
    }];
    
    [viewModel requestGoodsDetailsViewControllerDataWithTaoBaoID:self.taobao_num_iid];
}

- (void)getSizeAndColorArray:(GoodsDetailsbodyViewDataModel *)model {
    _sizeArray = [[NSMutableArray alloc] initWithCapacity:0];
    _colorArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (GoodsDetailsSkus *skus in model.data.skus) {
        NSString *size = skus.size;
        if (![_sizeArray containsObject:size]) {
            [_sizeArray addObject:size];
        }
        NSString *color = skus.style;
        if (![_colorArray containsObject:color]) {
            [_colorArray addObject:color];
        }
        _quantity = _quantity + [skus.quantity floatValue];
    }
     [self createChoseGoodsView];
}

#pragma mark - createChoseGoodsView
- (void)createChoseGoodsView {
    self.choseGoodsView = [[JBChoseGoodsView alloc] initWithFrame:CGRectMake(0, kHEIGHT, kWIDTH, kHEIGHT)];
    [self.view addSubview:self.choseGoodsView];
    //尺码
    __weak typeof(self)weakSelf = self;
    self.choseGoodsView.sizeTypeView = [[JBGoodsTypeView alloc] initWithFrame:CGRectMake(0, 0, self.choseGoodsView.frame.size.width, 50) dataSource:_sizeArray typeName:@"尺码"];
    
    self.choseGoodsView.sizeTypeView.callBack = ^(int selectIndex){
        [weakSelf selectBtnAtIndex:selectIndex];
    };
    [self.choseGoodsView.mainGoodsMessageView addSubview:self.choseGoodsView.sizeTypeView];
    self.choseGoodsView.sizeTypeView.frame = CGRectMake(0, 0, self.choseGoodsView.frame.size.width, self.choseGoodsView.sizeTypeView.height);
    //颜色分类
    self.choseGoodsView.colorTypeView = [[JBGoodsTypeView alloc] initWithFrame:CGRectMake(0, self.choseGoodsView.sizeTypeView.frame.size.height, self.choseGoodsView.sizeTypeView.frame.size.width, 50)  dataSource:_colorArray typeName:@"选择颜色"];//colorARRAY
    
    self.choseGoodsView.colorTypeView.callBack = ^(int selectIndex) {
        [weakSelf selectBtnAtIndex:selectIndex];
    };
    [self.choseGoodsView.mainGoodsMessageView addSubview:self.choseGoodsView.colorTypeView];
    self.choseGoodsView.colorTypeView.frame = CGRectMake(0, self.choseGoodsView.sizeTypeView.frame.size.height, self.choseGoodsView.frame.size.width, self.choseGoodsView.colorTypeView.height);
    //购买数量
    self.choseGoodsView.jbBuyGoodsCountView.frame = CGRectMake(0, self.choseGoodsView.colorTypeView.frame.size.height+self.choseGoodsView.colorTypeView.frame.origin.y, self.choseGoodsView.frame.size.width, 50);
    self.choseGoodsView.mainGoodsMessageView.contentSize = CGSizeMake(self.view.frame.size.width, self.choseGoodsView.jbBuyGoodsCountView.frame.size.height+self.choseGoodsView.jbBuyGoodsCountView.frame.origin.y);
    [self.choseGoodsView.goodsImageView sd_setImageWithURL:[NSURL URLWithString:_dataModel.data.taobaoPicUrl]];
    self.choseGoodsView.priceLabel.text =@"价格:";
    self.choseGoodsView.stockLabel.text = [NSString stringWithFormat:@"库存:%.2f",_quantity];
    self.choseGoodsView.choseGoodsdetailLabel.text = @"请选择 尺码 颜色分类";
     self.choseGoodsView.stock = 0;
    [self.choseGoodsView.cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.choseGoodsView.sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.choseGoodsView.alphaiView addGestureRecognizer:tap];
    //点击图片放大图片
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBigImage:)];
    self.choseGoodsView.goodsImageView.userInteractionEnabled = YES;
    [self.choseGoodsView.goodsImageView addGestureRecognizer:tap1];

}

//购买或加入购物车
- (void)sureBtnClick:(UIButton *)btn {
    if (self.choseGoodsView.sizeTypeView.selectIndex < 0 || self.choseGoodsView.colorTypeView.selectIndex < 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择商品" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
       //alert.tag = 100;
        [alert show];
        return;
    }
    
    int count =[self.choseGoodsView.jbBuyGoodsCountView.goodsCountTextf.text intValue];
    
    if (count > self.choseGoodsView.stock) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"库存不足" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alert.tag = 100;
            [alert show];
        return;
    }
    DateBaseModelCollectionGoods *goods = [DateBaseModelCollectionGoods new];
    goods.taobao_num_iid = [_dataModel.data.taobaoNumIid intValue];
    goods.taobao_pic_url = _dataModel.data.taobaoPicUrl;
    goods.taobao_title = _dataModel.data.taobaoTitle;
    NSDateFormatter *dateFormate = [NSDateFormatter new];
    dateFormate.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    goods.date = [dateFormate stringFromDate:[NSDate date]];

    if ([btn.titleLabel.text isEqualToString:@"加入购物车"]) {
        [self dismiss];
               [FMDBManager insertCollectFromMessage:goods];
        [self performSelector:@selector(animationWithBuy) withObject:nil afterDelay:0];
    }else {
        JBLOG(@"去支付宝");
    }
}

- (void)showBigImage:(UITapGestureRecognizer *)info {
    JBLOG(@"showBigImage");
}

#pragma mark - barButtons
-(void)creatBarView
{
    UIView *backBarView=[[UIView alloc]init];
    backBarView.backgroundColor=[UIColor whiteColor];
    backBarView.layer.borderColor=[UIColor blackColor].CGColor;
    backBarView.layer.borderWidth=1.0;
    [self.view addSubview:backBarView];
    [backBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        make.height.offset(50);
    }];
    
    UIButton *participateButton=[UIButton new];
    participateButton.backgroundColor=[UIColor yellowColor];
    participateButton.clipsToBounds=YES;
    participateButton.layer.cornerRadius=5;
    participateButton.tag=100;
    [participateButton setTitle:@"我要加盟" forState:UIControlStateNormal];
    [participateButton setTitleColor:[UIColor colorWithRed:255/256.0 green:83/256.0 blue:135/256.0 alpha:1] forState:UIControlStateNormal];
    participateButton.titleLabel.font=[UIFont systemFontOfSize:12];
    [participateButton addTarget:self action:@selector(participateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [backBarView addSubview:participateButton];
    
    [participateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.left.offset(10);
        make.width.offset(80);
        make.height.offset(40);
    }];
    
    
    UIButton *lastButton=nil;
    for (int i=0; i<3; i++) {
        
        UIButton *button=[[UIButton alloc]init];
        if (i==0) {
            
            button.backgroundColor=[UIColor redColor];
            [button setTitle:@"立即购买" forState:UIControlStateNormal];
        }
        if (i==1) {
            
            
            [button setImage:[UIImage imageNamed:@"button_add_shop.png"] forState:UIControlStateNormal];
        }
        if (i==2) {
            
            
            [button setImage:[UIImage imageNamed:@"PopupDialogDafen去评分按钮.png"] forState:UIControlStateNormal];
        }
        
        button.tag=i+100;
        [button addTarget:self action:@selector(barButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [backBarView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(5);
            make.bottom.offset(-5);
            if (i==0) {
                make.right.offset(-5);
                make.width.offset(80);
            }else if (i==1) {
                make.right.equalTo(lastButton.mas_left).offset(-20);
                make.width.offset(50);
            }else {
                make.right.equalTo(lastButton.mas_left).offset(-10);
                make.width.offset(90);
            }
        }];
        
        lastButton=button;
    }
    [self.view bringSubviewToFront:backBarView];
}

-(void)barButtonClicked:(UIButton *)button
{
    //[self.navigationController setNavigationBarHidden:YES];
    if (button.tag == 100) {
        [self.choseGoodsView.sureBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    }else if (button.tag == 101) {
        [self.choseGoodsView.sureBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    }else {
        JBLOG(@"去评分");
    }
    nav.hidden = YES;
    bodyViewOldCenter = bodyView.center;
    [UIView animateWithDuration: 0.35 animations: ^{
        bodyView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        bodyView.center = CGPointMake(self.view.center.x, self.view.center.y - 80);
        self.choseGoodsView.center = self.view.center;
        self.choseGoodsView.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
       
    } completion: nil];
    
}


/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    nav.hidden = NO;
    //[self.navigationController setNavigationBarHidden:NO];
    [UIView animateWithDuration: 0.35 animations: ^{
        self.choseGoodsView.frame =CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        
        bodyView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        bodyView.center = bodyViewOldCenter;
    } completion: nil];
    
}


-(void)participateButtonClicked:(UIButton *)button
{
    
    
}

#pragma mark - shoppingCarBtnClick
- (void)shoppingCarBtnClick:(UIButton *)btn {
    
}

#pragma mark - backBtnClick
- (void)backBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//选择了颜色和尺寸
- (void)getQuantityWithSize:(NSString *)size color:(NSString *)color {
    for (GoodsDetailsSkus *skus in _dataModel.data.skus) {
        if ([skus.style isEqualToString:color] && [skus.size isEqualToString:size]) {
            self.choseGoodsView.stockLabel.text  = [NSString stringWithFormat:@"库存:%@",skus.quantity];
            self.choseGoodsView.stock = [skus.quantity intValue];
            [self.choseGoodsView.goodsImageView sd_setImageWithURL:[NSURL URLWithString:skus.taobaoPicUrl]];
            self.choseGoodsView.priceLabel.text = [NSString stringWithFormat:@"价格:%@%@",skus.taobaoPrice,skus.moneySymbol];
         }
    }

}

#pragma mark - jbchoseGoodsView
- (void)selectBtnAtIndex:(int)index {
    //通过seletIndex是否>=0来判断尺码和颜色是否被选择，－1则是未选择状态
    if (self.choseGoodsView.sizeTypeView.selectIndex >=0&&self.choseGoodsView.colorTypeView.selectIndex >=0) {
        //尺码和颜色都选择的时候
        NSString *size =[_sizeArray objectAtIndex:self.choseGoodsView.sizeTypeView.selectIndex];
        NSString *color =[_colorArray objectAtIndex:self.choseGoodsView.colorTypeView.selectIndex];
        //根据颜色和尺寸获得库存量
       [self getQuantityWithSize:size color:color];
        
        self.choseGoodsView.choseGoodsdetailLabel.text = [NSString stringWithFormat:@"已选 \"%@\" \"%@\"",size,color];

//        [self reloadTypeBtn:[_stockarr objectForKey:size] :_colorArray :self.choseGoodsView.colorTypeView];
//        [self reloadTypeBtn:[_stockarr objectForKey:color] :_sizeArray :self.choseGoodsView.sizeTypeView];
 //       JBLOG(@"%d",self.choseGoodsView.colorTypeView.selectIndex);

    }else if (self.choseGoodsView.sizeTypeView.selectIndex ==-1&&self.choseGoodsView.colorTypeView.selectIndex == -1)
    {
        //尺码和颜色都没选的时候
        self.choseGoodsView.choseGoodsdetailLabel.text = @"请选择 尺码 颜色分类";
        //self.choseGoodsView.stock = 100000;
        //全部恢复可点击状态
        [self resumeBtn:_colorArray :self.choseGoodsView.colorTypeView];
        [self resumeBtn:_sizeArray :self.choseGoodsView.sizeTypeView];
        
    }else if (self.choseGoodsView.sizeTypeView.selectIndex ==-1&&self.choseGoodsView.colorTypeView.selectIndex >= 0)
    {
//        //只选了颜色
//        NSString *color =[_colorArray objectAtIndex:self.choseGoodsView.colorTypeView.selectIndex];
//        //根据所选颜色 取出该颜色对应所有尺码的库存字典
//        NSDictionary *dic = [_stockarr objectForKey:color];
//        [self reloadTypeBtn:dic :_sizeArray :self.choseGoodsView.sizeTypeView];
//
        [self resumeBtn:_colorArray :self.choseGoodsView.colorTypeView];
        //self.choseGoodsView.stockLabel.text = @"库存100000件";
        self.choseGoodsView.choseGoodsdetailLabel.text = @"请选择 尺码";

    }else if (self.choseGoodsView.sizeTypeView.selectIndex >= 0&&self.choseGoodsView.colorTypeView.selectIndex == -1)
    {
        //只选了尺码
//        NSString *size =[_sizeArray objectAtIndex:self.choseGoodsView.sizeTypeView.selectIndex];
//        //根据所选尺码 取出该尺码对应所有颜色的库存字典
//        NSDictionary *dic = [_stockarr objectForKey:size];
        [self resumeBtn:_sizeArray :self.choseGoodsView.sizeTypeView];
//        [self reloadTypeBtn:dic :_colorArray :self.choseGoodsView.colorTypeView];
        self.choseGoodsView.stockLabel.text = @"库存100000件";
        self.choseGoodsView.choseGoodsdetailLabel.text = @"请选择 颜色分类";
        self.choseGoodsView.stock = 100000;
        
        //        for (int i = 0; i<colorarr.count; i++) {
        //            int count = [[dic objectForKey:[colorarr objectAtIndex:i]] intValue];
        //            //遍历颜色字典 库存为零则改尺码按钮不能点击
        //            if (count == 0) {
        //                UIButton *btn =(UIButton *) [choseView.colorView viewWithTag:100+i];
        //                btn.enabled = NO;
        //            }
        //        }
        
    }
    
}


#pragma mark - 加入购物车动画
-(void)animationWithBuy
{
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
       [bezierPath moveToPoint:CGPointMake(kWIDTH/2, kHEIGHT-100)];
    [bezierPath addCurveToPoint:CGPointMake(kWIDTH-20, 40) controlPoint1:CGPointMake(kWIDTH/4, kHEIGHT/3) controlPoint2:CGPointMake(kWIDTH-50, kHEIGHT/5)];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.delegate=self;
    animation.path = bezierPath.CGPath;
    [_animationImageView.layer addAnimation:animation forKey:nil];
    
    
    CABasicAnimation *boundsAnimation=[CABasicAnimation animation];
    boundsAnimation.keyPath=@"bounds";
    boundsAnimation.duration=1.0;
    boundsAnimation.fromValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    boundsAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 20,20)];
    [_animationImageView.layer addAnimation:boundsAnimation forKey:nil];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    _goodsNumberLabel.text=[FMDBManager getColletCounts];
    CAKeyframeAnimation *key=[CAKeyframeAnimation animation];
    key.duration=0.1;
    key.keyPath=@"position";
    key.values=@[[NSValue valueWithCGPoint:CGPointMake(kWIDTH-15, 30)],[NSValue valueWithCGPoint:CGPointMake(kWIDTH-20, 30)],[NSValue valueWithCGPoint:CGPointMake(kWIDTH-10, 30)],[NSValue valueWithCGPoint:CGPointMake(kWIDTH-20, 30)]];
    [_goodsNumberLabel.layer addAnimation:key forKey:nil];
    
}

//恢复按钮的原始状态
-(void)resumeBtn:(NSArray *)arr :(JBGoodsTypeView *)view
{
//    for (int i = 0; i< arr.count; i++) {
//        UIButton *btn =(UIButton *) [view viewWithTag:100+i];
//        btn.enabled = YES;
//        btn.selected = NO;
//        //[btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
//        if (view.selectIndex == i) {
//            btn.selected = YES;
//            //[btn setBackgroundColor:[UIColor redColor]];
//        }
//    }
}
////根据所选的尺码或者颜色对应库存量 确定哪些按钮不可选
//-(void)reloadTypeBtn:(NSDictionary *)dic :(NSArray *)arr :(JBGoodsTypeView *)view
//{
//    for (int i = 0; i<arr.count; i++) {
//        int count = [[dic objectForKey:[arr objectAtIndex:i]] intValue];
//        UIButton *btn =(UIButton *)[view viewWithTag:100+i];
//        btn.selected = NO;
//        [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
//        //库存为零 不可点击
//        if (count == 0) {
//            btn.enabled = NO;
//            [btn setTitleColor:[UIColor lightGrayColor] forState:0];
//        }else
//        {
//            btn.enabled = YES;
//            [btn setTitleColor:[UIColor blackColor] forState:0];
//        }
//        //根据seletIndex 确定用户当前点了那个按钮
//        if (view.selectIndex == i) {
//            btn.selected = YES;
//            [btn setBackgroundColor:[UIColor redColor]];
//        }
//    }
//}


@end
