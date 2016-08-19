//
//  JBNavigationController.m
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBNavigationController.h"

@interface JBNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation JBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBarHidden = YES;
    //self.hidesBarsOnSwipe = YES;//向上或向下轻扫
    //self.hidesBarsOnTap = YES;//点击
    self.interactivePopGestureRecognizer.delegate = self;//右滑 pop

}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /*判断手势是interactivePopGestureRecognizer 还是别的（hidesBarsOnTap）如果不这么判断会手势冲突：当self.viewControllers.count <= 1 时用interactivePopGestureRecognizer回导致hidesBarsOnTap&hidesBarsOnSwipe 失效（我觉得此时是系统默认返回NO）
     
     self.hidesBarsOnSwipe = YES;
     self.hidesBarsOnTap = YES;
     这些手势可以共存 亲测可行
     */
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count <= 1) {
            
            return NO;
        }else {
            return YES;
        }
    }
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
