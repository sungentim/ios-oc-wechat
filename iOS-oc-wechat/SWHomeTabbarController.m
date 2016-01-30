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
    discoveryCtrl.tabBarItem.title = @"发现1";
    
    SWMeViewController *meCtrl = [[SWMeViewController alloc] init];
    meCtrl.title = @"我";
    meCtrl.tabBarItem.title = @"我1";
    
    
    SWBaseNavigationController *chatNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:chatCtrl];
    chatNavCtrl.tabBarItem.title = @"微信1";
    chatNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_chat"];
    SWBaseNavigationController *consultNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:consultCtrl];
    consultNavCtrl.tabBarItem.title = @"通讯录1";
    consultCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    SWBaseNavigationController *discoveryNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:discoveryCtrl];
    discoveryNavCtrl.tabBarItem.title = @"发现1";
    discoveryNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    SWBaseNavigationController *meNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:meCtrl];
    meNavCtrl.tabBarItem.title = @"我1";
    meNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];
    
    //把VC放到数组中
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:@[chatNavCtrl,consultNavCtrl,discoveryNavCtrl,meNavCtrl]];
    //初始化Tabbarcontroller
    self.viewControllers = controllers;
    self.selectedIndex = 0;
}

@end
