//
//  UIViewController+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-28.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SWCategory)
#pragma mark -alertView弹出提示
- (void)messageBox:(NSString *)msg;
#pragma mark - 导航栏
- (void)i_setNavigationBarBackColor:(UIColor *)color;
#pragma mark -设置导航栏左侧按钮
- (void)i_setLeftBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (void)i_setLeftBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
- (void)i_setLeftBarButtonTextColor:(UIColor *)color;
#pragma mark -设置导航栏右侧按钮
- (void)i_setRightBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (void)i_setRightBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (void)i_setRightBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
#pragma mark -设置导航栏标题
- (void)i_setTitleText:(NSString *)title Color:(UIColor *)color font:(UIFont *)font;
- (void)i_setTitleView:(UIView *)view;
#pragma mark -设置导航栏 push后的返回按钮
- (void)i_setBackButtonWithWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (void)i_setBackButtonWithWithImage:(UIImage *)image highImage:(UIImage *)highImage  target:(id)target action:(SEL)action;
@end
