//
//  SWBaseViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWBaseViewController.h"

@implementation SWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    NSLogE(@"%@", @"测试打印Debug");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
