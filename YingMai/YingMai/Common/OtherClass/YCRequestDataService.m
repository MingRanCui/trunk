//
//  YCRequestDataService.m
//  FMDBdemo
//
//  Created by ChengxuZheng on 15/11/25.
//  Copyright © 2015年 ChengxuZheng. All rights reserved.
//

#import "YCRequestDataService.h"
#import <AFNetworking.h>

@implementation YCRequestDataService

+ (instancetype)sharedManager {
    static YCRequestDataService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YCRequestDataService alloc] initWithBaseURL:[NSURL URLWithString:YCNetBaseURLString]];
    });
    return instance;
}

#pragma mark - 当前网络类型
- (void)currentNetState:(NetStateBlock)state {
    self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    __weak YCRequestDataService *weakSelf = self;
    [weakSelf.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                _netState = @"WWAN";
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                _netState = @"WiFi";
                break;
            case AFNetworkReachabilityStatusNotReachable:
                _netState = @"NotReachable";
                break;
            default:
                break;
        }
        state(_netState);
    }];
    [self.reachabilityManager startMonitoring];
}

#pragma mark - Get请求
- (void)Get:(NSString *)api parameters:(NSDictionary *)dic success:(responseBlock)response {
    NSMutableString *fApi = [NSMutableString stringWithFormat:@"%@%@?",YCNetBaseURLString,api];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager GET:fApi parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        response(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - Post请求
- (void)Post:(NSString *)api parameters:(NSDictionary *)dic success:(responseBlock)response {
    NSMutableString *fApi = [NSMutableString stringWithFormat:@"%@%@?",YCNetBaseURLString,api];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager POST:fApi parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        response(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

/*AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 //申明返回的结果是json类型
 manager.responseSerializer = [AFJSONResponseSerializer serializer];
 //申明请求的数据是json类型
 manager.requestSerializer=[AFJSONRequestSerializer serializer];
 //如果报接受类型不一致请替换一致text/html或别的
 manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
 //传入的参数
 NSDictionary *parameters = @{@"1":@"XXXX",@"2":@"XXXX",@"3":@"XXXXX"};
 //你的接口地址
 NSString *url=@"http://xxxxx";
 //发送请求
 [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
 NSLog(@"JSON: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 NSLog(@"Error: %@", error);
 }];*/

#pragma mark - 时间戳转时间
/**
 * 年月日时分秒
 */
- (NSString *)timeintervalFormatYMDHMS:(NSNumber *)interval {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[interval doubleValue]];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd  hh:mm"];
    return [format stringFromDate:date];
}


@end
