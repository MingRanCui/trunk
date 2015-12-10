//
//  YCRequestDataService.h
//  FMDBdemo
//
//  Created by ChengxuZheng on 15/11/25.
//  Copyright © 2015年 ChengxuZheng. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *YCNetBaseURLString = @"http://10.23.102.251:8089/";
typedef void(^responseBlock)(id response);
typedef void(^NetStateBlock)(NSString *state);

@interface YCRequestDataService : AFHTTPSessionManager

@property (nonatomic, copy) NSString *netState;
/**
 * manager管理请求
 */
+ (instancetype)sharedManager;

/**
 * 网络判断
 */
- (void)currentNetState:(NetStateBlock)state;

/**
 * GET请求
 */
- (void)Get:(NSString *)api parameters:(NSDictionary *)dic success:(responseBlock)response;

/**
 * POST请求
 */
- (void)Post:(NSString *)api parameters:(NSDictionary *)dic success:(responseBlock)response;

/**
 * 时间戳转时间 - 年月日时分秒
 */
- (NSString *)timeintervalFormatYMDHMS:(NSNumber *)interval;


@end
