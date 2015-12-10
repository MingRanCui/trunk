//
//  YMHomeSortTableViewCell.m
//  YingMai
//
//  Created by 崔明燃 on 15/12/9.
//  Copyright © 2015年 崔明燃. All rights reserved.
//

#import "YMHomeSortTableViewCell.h"

@implementation YMHomeSortTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self.contentView addSubview:self.txtLabel];
    }
    
    return self;
}

#pragma mark - 赋值
-(void)addTheModel:(YMHomeSortModel *)model {
    self.txtLabel.text = model.text;
}

#pragma mark - layout subviews
- (void)layoutSubviews {
    [super layoutSubviews];
    [_txtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(@30);
    }];
}

#pragma mark - lazy loading
- (UILabel *)txtLabel {
    if (!_txtLabel) {
        _txtLabel = [[UILabel alloc] init];
        _txtLabel.font = Font(15);
        _txtLabel.textColor = RGB(69, 69, 69, 1.0);
        _txtLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _txtLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
