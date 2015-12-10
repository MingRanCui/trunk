//
//  YMHomeSortTableViewCell.h
//  YingMai
//
//  Created by 崔明燃 on 15/12/9.
//  Copyright © 2015年 崔明燃. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMHomeSortModel.h"

@interface YMHomeSortTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *txtLabel;  // 分类标题

// 赋值
- (void)addTheModel:(YMHomeSortModel *)model;

@end
