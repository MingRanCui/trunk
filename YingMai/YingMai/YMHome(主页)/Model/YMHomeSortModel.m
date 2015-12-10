//
//  YMHomeSortModel.m
//  YingMai
//
//  Created by 崔明燃 on 15/12/9.
//  Copyright © 2015年 崔明燃. All rights reserved.
//

#import "YMHomeSortModel.h"

@implementation YMHomeSortModel

- (id)initWithDataDic:(NSDictionary *)data {
    if (self = [super init]) {
        self.isSelected = data[@"isSelected"];
        self.text = data[@"text"];
    }
    
    return self;
}

@end
