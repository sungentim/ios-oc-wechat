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

//默认先执行 layoutSubViewEndDoBlock_onlyOnce
//如果为 YES: 则先执行 layoutSubViewEndDoBlock， 再执行 layoutSubViewEndDoBlock_onlyOnce
@property (nonatomic, assign) BOOL i_isDependentEveryTimeBlock;

@property (nonatomic, assign) SWVoidBlock_id layoutSubViewEndDoBlock_onlyOnce;
@property (nonatomic, assign) SWVoidBlock_id layoutSubViewEndDoBlock; //everyTime
- (void)i_layoutSubViewsEndDo_onlyOnce:(SWVoidBlock_id)block;
- (void)i_layoutSubViewsEndDo:(SWVoidBlock_id)block;
- (void)i_layoutSubViewsEndDo_onlyOnce:(SWVoidBlock_id)onlyOnceBlock everyTime:(SWVoidBlock_id)everyTime;


+ (instancetype)cellGetWithTableView: (UITableView *)tableView Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

//对新增空间设置key
- (void) setObject: (NSObject *)object forMyKey:(NSString *)key;
- (id) objectForMyKey:(NSString *)key;



@end
