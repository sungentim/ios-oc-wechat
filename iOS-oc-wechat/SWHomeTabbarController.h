//
//  SWHomeTabbarController.h
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWHomeTabbarController : UITabBarController

@property (nonatomic,assign) int currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;

@end
