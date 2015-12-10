//
//  YMHomeViewController.m
//  YingMai
//
//  Created by 崔明燃 on 15/12/9.
//  Copyright © 2015年 崔明燃. All rights reserved.
//

#import "YMHomeViewController.h"
#import "YMHomeSortTableViewCell.h"
#import "YMHomeListTableViewCell.h"
#import "YMHomeSortModel.h"


static CGFloat sortTableViewWith = 85;
static NSString *sortTableViewIdentifier = @"sortTableViewCellIdentifier";
static NSString *listTableViewIdentifier = @"listTableViewCellIdentifier";

@interface YMHomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *sortTableView;  // 分类的tableview
@property (strong, nonatomic) UITableView *listTabelView;  // 分类列表

@property (strong, nonatomic) NSMutableArray *dataArray;  // 数据源数组
@property (nonatomic) NSInteger selectedIndex;

@end

@implementation YMHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"YM";
    
    [self layoutSubViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectedIndex = 0;
    
    _dataArray = [NSMutableArray array];
    NSArray *textArr = @[@"涨薪", @"家人", @"单位", @"同学", @"java"];
    for (int i = 0; i < 5; i++) {
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        
        [dic setValue:@NO forKey:@"isSelected"];
        [dic setValue:textArr[i] forKey:@"text"];
        YMHomeSortModel *model = [[YMHomeSortModel alloc] initWithDataDic:dic];
        [_dataArray addObject:model];
    }
    
    self.view.backgroundColor = RGB(1, 174, 159, 1.0);
    
    [self.view addSubview:self.sortTableView];
    [self.view addSubview:self.listTabelView];
}

// 当视图加载完成时 默认第一个cell为点击状态
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self selectIndexPathZero];
}

// 默认选中第一个cell
- (void)selectIndexPathZero {
    
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:_selectedIndex inSection:0];

    [self.sortTableView selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];

    if ([self.sortTableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.sortTableView.delegate tableView:self.sortTableView didSelectRowAtIndexPath:selectedIndexPath];
    }
}


#pragma mark - tableView DataSource and Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _sortTableView) {
        return 70;
    } else if (tableView == _listTabelView) {
        return 90;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == _listTabelView) {
        return 0.01;
    } else if (tableView == _sortTableView) {
        return 0.01;
    }
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (tableView == _sortTableView) {
        return 0.1;
    }
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _sortTableView) {
        return _dataArray.count;
    } else if (tableView == _listTabelView) {
        return 10;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _sortTableView) {
        
        _selectedIndex = indexPath.row;
        
        YMHomeSortTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        cell.isSelected = YES;
        
        cell.backgroundColor = RGB(1, 174, 159, 1.0);
        
        NSLog(@"%@", @"0");
    }
}

// 当cell取消选中状态时
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _sortTableView) {
        YMHomeSortTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        cell.isSelected = NO;
        
        cell.backgroundColor = [UIColor whiteColor];
        
        NSLog(@"%@", @"0");
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _sortTableView) {
        YMHomeSortTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sortTableViewIdentifier];
        
        YMHomeSortModel *model = _dataArray[indexPath.row];
        
        [cell addTheModel:model];
        
        return cell;
    } else if (tableView == _listTabelView) {
        YMHomeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listTableViewIdentifier];
        
        return cell;
    }
    
    YMHomeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listTableViewIdentifier];
    
    return cell;
}

#pragma mark - layout subviews
- (void)layoutSubViews {
    [_sortTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(@(sortTableViewWith));
        make.height.equalTo(self.view.mas_height);
    }];
    
    [_listTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.sortTableView.mas_right).offset(2);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(self.view.mas_height);
    }];
}

#pragma mark - lazy loading
- (UITableView *)sortTableView {
    if (!_sortTableView) {
        _sortTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _sortTableView.delegate = self;
        _sortTableView.dataSource = self;
        _sortTableView.showsVerticalScrollIndicator = NO;
        _sortTableView.backgroundColor = [UIColor whiteColor];
        
        [_sortTableView registerClass:[YMHomeSortTableViewCell class] forCellReuseIdentifier:sortTableViewIdentifier];
    }
    
    return _sortTableView;
}

- (UITableView *)listTabelView {
    if (!_listTabelView) {
        _listTabelView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _listTabelView.delegate = self;
        _listTabelView.dataSource = self;
        _listTabelView.showsVerticalScrollIndicator = NO;
        [_listTabelView registerClass:[YMHomeListTableViewCell class] forCellReuseIdentifier:listTableViewIdentifier];
    }
    
    return _listTabelView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
