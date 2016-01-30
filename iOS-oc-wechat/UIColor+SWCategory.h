//
//  UIColor+SWCategory.h
//  appDoctor
//
//  Created by wangsen on 14-10-23.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SWCategory)
#pragma mark - hexString eg. #ff0000
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *
 *  @return color类型的数据
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *  @param alpha     透明度
 *
 *  @return color类型的数据
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
@end
