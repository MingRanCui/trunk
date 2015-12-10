//
//  ViewController.m
//  YingMai
//
//  Created by 崔明燃 on 15/12/10.
//  Copyright © 2015年 崔明燃. All rights reserved.
//

#import "ViewController.h"
#import "BaseNavigationController.h"
#import "YMHomeViewController.h"
#import "YMMeViewController.h"

@interface ViewController () {
    NSInteger _selectedIndex;   //选中界面
    BOOL _isFirst;              //首次点击
}

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self _removeSystemTabBarButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _customTabBarButton];
    [self _addSubviewControlls];
    
}

/*
 添加子视图控制器
 */
- (void)_addSubviewControlls {
    
    YMHomeViewController *homeVC = [[YMHomeViewController alloc] init];
    YMMeViewController *meVC = [[YMMeViewController alloc] init];
    NSArray *controlls = @[homeVC,meVC];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (int i = 0; i < controlls.count; i++) {
        BaseNavigationController *navController = [[BaseNavigationController alloc] initWithRootViewController:controlls[i]];
        [viewControllers addObject:navController];
    }
    self.viewControllers = viewControllers;
}

#pragma mark - 自定义标签栏

/*
 移除系统标签栏按钮
 */

- (void)_removeSystemTabBarButton {
    for (UIView *view in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
}

/*
 定制标签栏按钮
 */

- (void)_customTabBarButton {
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBar_bg"];
    
    NSArray *nImageNames = @[@"home_normal",
                             @"mine_normal",];
    NSArray *pImageNames = @[@"home_press",
                             @"mine_press",];
    
    CGFloat buttonWidth = MSSize_Width/nImageNames.count;
    for (int i = 0; i < nImageNames.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonWidth * i, 0, buttonWidth, kTB_Height);
        button.tag = 1100 + i;
        [button setImage:[UIImage imageNamed:nImageNames[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:pImageNames[i]] forState:UIControlStateSelected];
        [button addTarget:self
                   action:@selector(buttonAction:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
        
        if (i == 0) {
            _isFirst = YES;
            button.selected = YES;
            button.userInteractionEnabled = NO;
        }
    }
}

#pragma mark - 用户事件
/*
 视图切换
 */
- (void)buttonAction:(UIButton *)sender {
    if (_isFirst) {
        _isFirst = NO;
        UIButton *tabBarItem = (UIButton *)[self.view viewWithTag:1100];
        tabBarItem.userInteractionEnabled = YES;
    }
    if (_selectedIndex != sender.tag - 1100) {
        UIButton *tabBarItem = (UIButton *)[self.view viewWithTag:_selectedIndex + 1100];
        if (tabBarItem.selected) {
            tabBarItem.selected = NO;
        }
        sender.selected = YES;
        tabBarItem.userInteractionEnabled = YES;
        sender.userInteractionEnabled = NO;
        _selectedIndex = sender.tag - 1100;
    }
    self.selectedIndex = _selectedIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
