//
//  YMHomeListTableViewCell.h
//  YingMai
//
//  Created by 崔明燃 on 15/12/9.
//  Copyright © 2015年 崔明燃. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMHomeListTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *headImg;  // 头像
@property (strong, nonatomic) UILabel *nameLabel;    // 名字
@property (strong, nonatomic) UILabel *jobLabel;     // 职位
@property (strong, nonatomic) UILabel *moneyLabel;   // 薪水
@property (strong, nonatomic) UIButton *phoneButton; // 电话按钮

@end
