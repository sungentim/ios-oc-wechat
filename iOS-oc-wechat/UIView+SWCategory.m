//
//  UIView+SWCategory.m
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/31.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "UIView+SWCategory.h"

@implementation UIView (SWCategory)


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
@end
