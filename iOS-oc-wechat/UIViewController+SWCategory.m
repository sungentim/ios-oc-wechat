//
//  UIViewController+WSCategory.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-28.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "UIViewController+SWCategory.h"
@implementation UIViewController (TXCategory)

//alertView弹出提示
- (void)messageBox:(NSString *)msg
{
    if (![msg isPresent]) {
        msg = @"您有必填项没有填写";
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    });
}
#pragma mark - 导航栏
/**
 *  设置导航栏的背景颜色(全局)
 *  修改UINavigationBar的背景颜色(iOS7以上)
 *  @param color 导航栏背景颜色
 */
+ (void)i_setNavigationBarBackColor:(UIColor *)color
{
    [[UINavigationBar appearance] setBarTintColor:color];
}
#pragma mark -设置导航栏左侧按钮
/**
 *  设置导航栏左侧按钮
 *
 *  @param image  按钮图片
 *  @param target 目标
 *  @param action 方法
 */
- (void)i_setLeftBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    [self i_setLeftBarButtonWithImage:image highImage:nil target:target action:action];
}
/**
 *  设置导航栏左侧按钮
 *
 *  @param image     按钮图片
 *  @param highImage 按钮高亮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)i_setLeftBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *leftButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 29, 25)];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:image forState:UIControlStateNormal];
    [leftButton setImage:highImage forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem=buttonItem;
    
}
/**
 *  设置导航栏左边按钮的字体颜色（全局）
 *
 *  @param color 字体颜色
 */
- (void)i_setLeftBarButtonTextColor:(UIColor *)color
{
    //返回按钮颜色
    [[UINavigationBar appearance]setTintColor:color];
}
#pragma mark -设置导航栏右侧按钮
- (void)i_setRightBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *rightButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 25)];
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.3] forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=buttonItem;
}
/**
 *  设置导航栏右侧按钮
 *
 *  @param image  按钮图片
 *  @param target 目标
 *  @param action 方法
 */
- (void)i_setRightBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    [self i_setRightBarButtonWithImage:image highImage:nil target:target action:action];
}
/**
 *  设置导航栏右侧按钮
 *
 *  @param image     按钮图片
 *  @param highImage 按钮高亮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)i_setRightBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    
    UIButton *rightButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setImage:highImage forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=buttonItem;
}
#pragma mark -设置标题
/**
 *  设置导航栏标题的 颜色 和 字体
 *
 *  @param color 标题颜色
 *  @param font  标题字体
 */
- (void)i_setTitleText:(NSString *)title Color:(UIColor *)color font:(UIFont *)font
{
    self.title = title;
#if __IPHONE_OS_VERSION_MAX_ALLOWED == __IPHONE_7_0 || __IPHONE_OS_VERSION_MAX_ALLOWED == __IPHONE_5_0
    //设置标题颜色
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:color,UITextAttributeTextColor,font,UITextAttributeFont, nil];
#else
    //设置标题颜色
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,font,NSFontAttributeName, nil];
#endif
    self.navigationController.navigationBar.titleTextAttributes = dict;
}
/**
 *  设置导航栏标题的 view
 *
 *  @param tiltleView 标题颜色
 */
- (void)i_setTitleView:(UIView *)tiltleView
{
    [self.navigationItem setTitleView:tiltleView];
}
/**
 *  设置导航栏push到另一个导航栏的返回按钮
 *
 *  @param image     按钮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)i_setBackButtonWithWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    [self i_setBackButtonWithWithImage:image highImage:nil target:target action:action];
}
/**
 *  设置导航栏push到另一个导航栏的返回按钮
 *
 *  @param image     按钮图片
 *  @param highImage 按钮高亮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)i_setBackButtonWithWithImage:(UIImage *)image highImage:(UIImage *)highImage  target:(id)target action:(SEL)action
{
    
    UIButton *backButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 28)];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.backBarButtonItem=buttonItem;
}

#pragma mark - TabBarsa
- (void)i_setTabBarButtonClickColor:(UIColor *)color
{
    [[self.tabBarController tabBar]setTintColor:[UIColor redColor]];
}


// 是否支持屏幕旋转
- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
