//
//  UIView+SWCategory.m
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/31.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "UIView+SWCategory.h"

@implementation UIView (SWCategory)



////////==========================================================
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

/**
 *  获取父类（包括超父类）对象
 *
 *  @param aClass 父类类型
 *
 *  @return 父类对象 找不到返回nil
 */
- (UIView *)i_superview_withSuperClassType:(Class)aClass
{
    if (self.superview) {
        if ([self.superview isKindOfClass:aClass]) {
            return self.superview;
        } else {
            return [self.superview i_superview_withSuperClassType:aClass];
        }
    } else {
        return nil;
    }
}


- (NSString *)i_howLayout
{
    if ([self isKindOfClass:[UITableViewCell class]]) return @"";
    // 1. 初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2. 标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", self.class, NSStringFromCGRect(self.frame)];
    if (!CGPointEqualToPoint(self.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(self.bounds)];
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)self;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3. 判断是否要结束
    if (self.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4. 遍历所有的子控件
    for (UIView *child in self.subviews) {
        NSString *childXml = [child i_howLayout];
        [xml appendString:childXml];
    }
    
    // 5. 标签结尾
    [xml appendFormat:@"</%@>", self.class];
    return xml;
}
@end
