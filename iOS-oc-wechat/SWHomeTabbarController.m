//
//  SWHomeTabbarController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWHomeTabbarController.h"

#import "SWBaseNavigationController.h"

#import "SWChatViewController.h"
#import "SWConsultViewController.h"
#import "SWDiscoveryViewController.h"
#import "SWMeViewController.h"

@interface SWHomeTabbarController ()

@end

@implementation SWHomeTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 设置viewControllers
    [self configureViewControllers];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)configureViewControllers {
    //初始化ViewController
    SWChatViewController *chatCtrl = [[SWChatViewController alloc] init];
    chatCtrl.title = @"微信";
    
    SWConsultViewController *consultCtrl = [[SWConsultViewController alloc] init];
    consultCtrl.title = @"通讯录";
    
    SWDiscoveryViewController *discoveryCtrl = [[SWDiscoveryViewController alloc] init];
    discoveryCtrl.title = @"发现";
    
    SWMeViewController *meCtrl = [[SWMeViewController alloc] init];
    meCtrl.title = @"我";
    
    SWBaseNavigationController *chatBaseNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:chatCtrl];
    SWBaseNavigationController *consultBaseNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:consultCtrl];
    SWBaseNavigationController *discoveryBaseNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:discoveryCtrl];
    SWBaseNavigationController *meBaseNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:meCtrl];
    
    //把VC放到数组中
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:@[chatBaseNavCtrl,consultBaseNavCtrl,discoveryBaseNavCtrl,meBaseNavCtrl]];
    //初始化Tabbarcontroller
    self.viewControllers = controllers;
    self.selectedIndex = 0;
}

@end
