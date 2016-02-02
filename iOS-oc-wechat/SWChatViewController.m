//
//  SWChatViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWChatViewController.h"
#import "UIViewController+SWCategory.h"
@interface SWChatViewController ()

@end

@implementation SWChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
}

#pragma mark - 设置导航条
- (void)setNavigationBar {
    [self i_setRightBarButtonWithImage:[UIImage imageNamed:@"wechat_barbutton_add"] target:self action:@selector(rightBarButtonClick)];
}
- (void)rightBarButtonClick {
    NSLog(@"%@", @"bar button click");
}

@end
