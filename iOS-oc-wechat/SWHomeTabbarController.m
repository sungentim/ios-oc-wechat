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

#import "UIView+SWLayout.h"
@interface SWHomeTabbarController ()

@end

@implementation SWHomeTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 设置viewControllers
    [self configureViewControllers];
    // 隐藏系统tabbar
//    [self hideRealTabBar];
    // 设置custom tabbar
//    [self customTabbars];
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

//隐藏掉系统自带的tabbar
- (void)hideRealTabBar
{
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UITabBar class]]){
            view.hidden = YES;
            break;
        }
    }
    [self.tabBar setHidden:YES];
}

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
    
    
    SWBaseNavigationController *chatNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:chatCtrl];
    chatNavCtrl.tabBarItem.title = @"微信";
    chatNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_chat"];
    [chatNavCtrl setHidesBottomBarWhenPushed:YES];
    
    SWBaseNavigationController *consultNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:consultCtrl];
    consultNavCtrl.tabBarItem.title = @"通讯录";
    consultNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_contact"];
    [consultNavCtrl setHidesBottomBarWhenPushed:YES];
    
    SWBaseNavigationController *discoveryNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:discoveryCtrl];
    discoveryNavCtrl.tabBarItem.title = @"发现";
    discoveryNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_discovery"];
    [discoveryNavCtrl setHidesBottomBarWhenPushed:YES];
    
    SWBaseNavigationController *meNavCtrl = [[SWBaseNavigationController alloc] initWithRootViewController:meCtrl];
    meNavCtrl.tabBarItem.title = @"我";
    meNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];
    [meNavCtrl setHidesBottomBarWhenPushed:YES];
    
    //把VC放到数组中
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:@[chatNavCtrl,consultNavCtrl,discoveryNavCtrl,meNavCtrl]];
    //初始化Tabbarcontroller
    self.viewControllers = controllers;
    self.selectedIndex = 0;
}

- (void)customTabbars {
    NSArray *images = @[@"tabbar_chat", @"tabbar_contact", @"tabbar_discovery", @"tabbar_me"];
    NSArray *highlight_images = @[@"tabbar_chat_highlight", @"tabbar_contact_highlight", @"tabbar_discovery_highlight", @"tabbar_me_highlight"];
    
    UIView *buttonContentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.tabBar.y, self.tabBar.width, self.tabBar.frame.size.height)];
    [buttonContentView setBackgroundColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]];
    [self.view addSubview:buttonContentView];
    
    //创建按钮
    NSInteger viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
    self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
    double _width = kkScreenWidth / viewCount;
    double _height = self.tabBar.frame.size.height;
    for (int i = 0; i < viewCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*_width,0, _width, _height);
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        btn.adjustsImageWhenHighlighted = NO;
        [btn setImage:[UIImage imageNamed:highlight_images[i]] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.buttons addObject:btn];
        [buttonContentView  addSubview:btn];
    }
    
    [self selectedTab:[self.buttons objectAtIndex:0]];
    [self.buttons[self.selectedIndex] setSelected:YES];
}

- (void)selectedTab:(UIButton *)button
{
    if (self.currentSelectedIndex == button.tag) {
        
        [([self.viewControllers objectAtIndex:button.tag]) popToRootViewControllerAnimated:YES];
        
        return;
    }
    
    [self.buttons[self.currentSelectedIndex] setSelected:NO];
    self.currentSelectedIndex = (int)button.tag;
    [self.buttons[self.currentSelectedIndex] setSelected:YES];
    
    self.selectedIndex = self.currentSelectedIndex;
}


@end
