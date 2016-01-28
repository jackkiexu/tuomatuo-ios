//
//  AppConstants.h
//  tuomatuo
//
//  Created by xjk on 1/10/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h

#import "NSDictionary+Extend.h"
#import "NSArray+Extend.h"
#import "UIImage+Extend.h"
#import "APIConstant.h"
#import "BaseApi.h"
#import "BaseView.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "BaseHelper.h"


#define kDataBasePath                                    [[(NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)) lastObject]stringByAppendingPathComponent:kDataBaseName] // 数据库路径
#define kDataBaseName                                    @"tuomatuo3.sqlite" // 数据库名称

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define PERCENT_WIDTH SCREEN_WIDTH/375.0
#define PERCENT_HEIGH SCREEN_HEIGHT/667.0

#define FontName            @"STHeitiSC-Light"

#define AFNetworkingOperationDidStartNotification  @"com.alamofire.networking.operation.start"
#define AFNetworkingOperationDidFinishNotification  @"com.alamofire.networking.operation.finish"

#define UpdateNoticeCount @"UpdateNoticeCount"

// Naviagtion 的颜色
#define kBlueColor [UIColor colorWithRed:90/255.0 green:199/255.0 blue:209/255.0 alpha:1.000]
// Tabbar_color
#define BGColor_Tabbar [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
#define BGColor_Select_Tabbar [UIColor colorWithRed:234/255.0 green:144/255.0 blue:144/255.0 alpha:1]

// 红色
#define kRedColor [UIColor colorWithRed:234/255.0 green:144/255.0 blue:144/255.0 alpha:1]// 灰色
#define kGrayColor [UIColor colorWithRed:116/255.0 green:126/255.0 blue:152/255.0 alpha:1.000]


#endif /* AppConstants_h */
