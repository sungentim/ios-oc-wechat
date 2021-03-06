//
//  SWBaseNavigationController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWBaseNavigationController.h"

@interface SWBaseNavigationController ()

@end

@implementation SWBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置状态栏背景颜色
//    [self setStatusBarBgColor];
    // Do any additional setup after loading the view.
    
    //为UINavigationBar设置半透明的背景效果 注:在iOS7中 默认生成 UINavigationBar的translucent属性为YES. 自动添加遮罩模糊效果.
    [self.navigationBar setTranslucent:YES];
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

// 自定义statusBar的背景颜色
//- (void)setStatusBarBgColor {
//    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kkScreenWidth, 20)];
//    statusBarView.backgroundColor=[UIColor colorWithHexString:@"f2f2f2"];
//    [self.view addSubview:statusBarView];
//}
//设置状态栏文字为白色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
