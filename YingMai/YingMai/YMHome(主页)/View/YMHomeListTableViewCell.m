//
//  YMHomeListTableViewCell.m
//  YingMai
//
//  Created by 崔明燃 on 15/12/9.
//  Copyright © 2015年 崔明燃. All rights reserved.
//

#import "YMHomeListTableViewCell.h"

@implementation YMHomeListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.jobLabel];
        [self.contentView addSubview:self.moneyLabel];
        [self.contentView addSubview:self.phoneButton];
    }
    
    return self;
}

#pragma mark - layout subviews
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(13);
        make.left.equalTo(self.headImg.mas_right).offset(5);
        make.width.equalTo(@45);
        make.height.equalTo(@30);
    }];
    
    [_jobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(13);
        make.left.equalTo(self.nameLabel.mas_right).offset(3);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(0);
        make.left.equalTo(self.headImg.mas_right).offset(5);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [_phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.left.equalTo(self.jobLabel.mas_right).offset(2);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(@40);
    }];
    
}

#pragma mark - lazy loading

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] init];
        _headImg.layer.borderWidth = .5;
        _headImg.backgroundColor = RGB(1, 174, 159, 1.0);
    }
    
    return _headImg;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = Font(15);
        _nameLabel.text = @"楼萧";
    }
    
    return _nameLabel;
}

- (UILabel *)jobLabel {
    if (!_jobLabel) {
        _jobLabel = [[UILabel alloc] init];
        _jobLabel.font = Font(13);
        _jobLabel.text = @"iOS开发工程师";
        _jobLabel.textColor = RGB(169, 169, 169, 1.0);
    }
    
    return _jobLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = Font(17);
        _moneyLabel.text = @"18000";
        _moneyLabel.textAlignment = NSTextAlignmentCenter;
        _moneyLabel.textColor = RGB(1, 174, 159, 1.0);
    }
    
    return _moneyLabel;
}

- (UIButton *)phoneButton {
    if (!_phoneButton) {
        _phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _phoneButton.backgroundColor = RGB(1, 174, 159, 1.0);
    }
    
    return _phoneButton;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
