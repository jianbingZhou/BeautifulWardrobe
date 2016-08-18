//
//  Define.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#ifndef Define_h
#define Define_h

#pragma mark - 常量

#define kWIDTH [UIScreen mainScreen].bounds.size.width

#define kHEIGHT [UIScreen mainScreen].bounds.size.height


#pragma mark - 警告框

#define  ALERTVIEW_KNOW(_info_) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:_info_ preferredStyle:UIAlertControllerStyleAlert];UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"知道啦" style:UIAlertActionStyleDefault handler:nil];[alertController addAction:okAction];[self presentViewController:alertController animated:YES completion:nil];


#define ALERTVIEW(_info_) UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"友情提示" message:_info_ delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; \
[alertView show];

#pragma mark - 控制台宏

// DEBUG控制台输出(若版本味debug版本打印，若版本为release版本不打印)
#ifdef DEBUG

#define JBLOG(...) NSLog(__VA_ARGS__);
#define JBLOG_METHOD NSLog(@"%s", __func__);// 打印方法名

#else

#define JBLOG(...);
#define JBLOG_METHOD;

#endif


#pragma mark - 颜色宏

// 获取RGB颜色
#define JBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JBColor_A(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/100.0]

#define JBColorFromRGB(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define JBWhiteColor [UIColor whiteColor]
#define JBRedColor   [UIColor redColor]
#define JBBlackColor [UIColor blackColor]


#endif /* Define_h */
