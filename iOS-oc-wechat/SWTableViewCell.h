//
//  SWTableViewCell.h
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/31.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWTableViewCell : UITableViewCell
typedef void (^SWVoidBlock_id)(SWTableViewCell *tableCell);

@property (nonatomic,assign) SWVoidBlock_id layoutSubViewEndDoBlock;
- (void)i_layoutSubViewsEndDo:(SWVoidBlock_id)block;

@end
