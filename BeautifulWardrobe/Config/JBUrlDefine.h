//
//  JBUrlDefine.h
//  BeautifulWardrobe
//
//  Created by Terra MacBook on 16/8/10.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#ifndef JBUrlDefine_h
#define JBUrlDefine_h

#pragma mark - HOST

#define Host @"http://vapi.yuike.com/" //服务器


#pragma mark - API

#define API Host@"1.0/"

// 1：中文 2：英文
#define Site_Users_Manual Host@"site/manual"

#define Site_Terms Host@"site/terms/"

#define Site_Buy Host@"store/index"

#define Site_ForgetPassword Host@"site/forget-password"

#define Site_Contact Host@"site/contact/"

#define Help_Index Host@"help/index"

/**
 *  [GET,0] GET请求 0安全验证否
 *  [POST,1] POST请求 1安全验证是
 */

//--------------------------------------------------
#define kHomeAdvertisingURL @"http://vapi.yuike.com/1.0/client/banner_list.php?mid=457465&sid=6593654d120f182ca16c3e1ab9eae526&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5139633"

#define kHomeFixedAdvertisingURL @"http://vapi.yuike.com/1.0/home/model_list.php?mid=457465&sid=6593654d120f182ca16c3e1ab9eae526&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5139633"

#define kHomeCollectionViewDataURL @"http://vapi.yuike.com/1.0/product/quality.php?count=40&cursor=0&mid=457465&sid=6593654d120f182ca16c3e1ab9eae526&type=choice&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5139633"

#define kGoodsDetailsURL @"http://vapi.yuike.com/1.0/product/detail.php?sid=5f948a5168e44fc57f4a64eec55ced92&taobao_num_iid="

#define kClassificationURL @"http://vapi.yuike.com/1.0/category/list.php?mid=457465&sid=b167b20264a4ca725ecf3e87d9df7290&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5139633%20HTTP/1.1"



#endif /* JBUrlDefine_h */
