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

@property (nonatomic,assign) SWVoidBlock_id layoutSubViewEndDoBlock_onlyOnce;
@property (nonatomic,assign) SWVoidBlock_id layoutSubViewEndDoBlock;
- (void)i_layoutSubViewsEndDo_onlyOnce:(SWVoidBlock_id)block;
- (void)i_layoutSubViewsEndDo:(SWVoidBlock_id)block;
- (void)i_layoutSubViewsEndDo_onlyOnce:(SWVoidBlock_id)onlyOnceBlock everyTime:(SWVoidBlock_id)everyTime;


+ (instancetype)cellGetWithTableView: (UITableView *)tableView Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



@end
