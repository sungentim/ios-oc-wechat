//
//  UIView+SWCategory.h
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/31.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SWCategory)

- (UIViewController*)viewController;
- (UIView *)i_superview_withSuperClassType:(Class)aClass;

@end
