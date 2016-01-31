//
//  UIView+SWLayout.m
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "UIView+SWLayout.h"

@implementation UIView (SWLayout)
#pragma mark - 设置x y width height 。。。
/**
 *  设置视图的 x
 *
 *  @param x 新的frame的 x 的值
 */
- (void) setX:(CGFloat)x
{
    self.frame = rectSetX(self.frame, x);
}
/**
 *  设置视图的 y
 *
 *  @param y 新的frame的 y 的值
 */
- (void) setY:(CGFloat)y
{
    self.frame = rectSetY(self.frame, y);
}
/**
 *  设置视图的 width
 *
 *  @param width 新的frame的 width 的值
 */
- (void) setWidth:(CGFloat)width
{
    self.frame = rectSetWidth(self.frame, width);
}
/**
 *  设置视图的 height
 *
 *  @param height 新的frame的 height 的值
 */
- (void) setHeight:(CGFloat)height
{
    self.frame = rectSetHeight(self.frame, height);
}
/**
 *  设置视图的 origin
 *
 *  @param origin 新的frame的 origin 的值
 */
- (void) setOrigin:(CGPoint)origin
{
    self.frame = rectSetOrigin(self.frame, origin);
}
/**
 *  设置视图的 size
 *
 *  @param size 新的frame的 size 的值
 */
- (void) setSize:(CGSize)size
{
    self.frame = rectSetSize(self.frame, size);
}
//私有 x
CGRect rectSetX(CGRect rect, CGFloat x) {
    return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height);
}
//y
CGRect rectSetY(CGRect rect, CGFloat y) {
    return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}
//width
CGRect rectSetWidth(CGRect rect, CGFloat width) {
    return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}
//height
CGRect rectSetHeight(CGRect rect, CGFloat height) {
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}
//origin
CGRect rectSetOrigin(CGRect rect, CGPoint origin) {
    return CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
}
//size
CGRect rectSetSize(CGRect rect, CGSize size) {
    return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

/////////////

/**
 *  获得 frame的 x 的值
 *
 *  @return 获得 frame的 x 的值
 */
- (CGFloat) x
{
    return self.frame.origin.x;
}
/**
 *  获得 frame的 y 的值
 *
 *  @return 获得 frame的 y 的值
 */
- (CGFloat) y
{
    return self.frame.origin.y;
}
/**
 *  获得 frame的 width 的值
 *
 *  @return 获得 frame的 width 的值
 */
- (CGFloat) width
{
    return self.frame.size.width;
}
/**
 *  获得 frame的 height 的值
 *
 *  @return 获得 frame的 height 的值
 */
- (CGFloat) height
{
    return self.frame.size.height;
}
/**
 *  获得 frame的 origin 的值
 *
 *  @return 获得 frame的 origin 的值
 */
- (CGPoint) origin
{
    return self.frame.origin;
}
/**
 *  获得 frame的 size 的值
 *
 *  @return 获得 frame的 size 的值
 */
- (CGSize)  size
{
    return self.frame.size;
}

//===========================================================
#pragma mark - 圆形视图
/**
 *  将视图 转换 成 圆形
 */
- (void)setBorderRadius:(CGFloat)radius
{
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}
@end
