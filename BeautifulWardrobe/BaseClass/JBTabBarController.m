//
//  JBTabBarController.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBTabBarController.h"

@interface JBTabBarController ()

@end

@implementation JBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildViewController:homeVC title:@"首页" imageName:@"yuike_maintab_home_nor.png" selectedImageName:@"yuike_maintab_home_sel.png"];
    
    ClassificationViewController *classificationVC = [[ClassificationViewController alloc] init];
    [self addChildViewController:classificationVC title:@"分类" imageName:@"yuike_maintab_category_nor.png" selectedImageName:@"yuike_maintab_category_sel.png"];
    
    ShoppingViewController *shoppingVC = [[ShoppingViewController alloc] init];
    [self addChildViewController:shoppingVC title:@"购物车" imageName:@"yuike_maintab_cart_nor.png" selectedImageName:@"yuike_maintab_cart_sel.png"];
    
    PersonalViewController *personalVC = [[PersonalViewController alloc] init];
    [self addChildViewController:personalVC title:@"个人信息" imageName:@"yuike_maintab_space_nor.png" selectedImageName:@"yuike_maintab_space_sel.png"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    childController.navigationItem.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childController.tabBarItem.selectedImage = selectedImage;
    //abbaritem.imageInsets=UIEdgeInsetsMake(6, 0,-6, 0);
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6.0f, 0, -6.0f, 0);
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    selectedTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childController.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    JBNavigationController *jbNav  = [[JBNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:jbNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
