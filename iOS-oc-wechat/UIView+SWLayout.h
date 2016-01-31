//
//  UIView+SWLayout.h
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SWLayout)

#pragma mark - 设置x y width height 。。。
- (void) setX:(CGFloat)x;
- (void) setY:(CGFloat)y;
- (void) setWidth:(CGFloat)width;
- (void) setHeight:(CGFloat)height;
- (void) setOrigin:(CGPoint)origin;
- (void) setSize:(CGSize)size;

- (CGFloat) x;
- (CGFloat) y;
- (CGFloat) width;
- (CGFloat) height;
- (CGPoint) origin;
- (CGSize)  size;

//设置圆角
- (void)setBorderRadius:(CGFloat)radius;

@end
