//
//  UIImage+SWCategory.h
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/31.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SWCategory)

+ (UIImage *)i_imageFromColor:(UIColor *)color;
+ (UIImage *)i_imageFromColor:(UIColor *)color size:(CGSize)size;

@end
