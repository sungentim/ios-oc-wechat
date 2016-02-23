//
//  SWTableViewCell.m
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/31.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWTableViewCell.h"
#import "UITableViewCell+SWCategory.h"

@implementation SWTableViewCell
{
    BOOL _is_first_run_layoutSubViewEndDoBlock_onlyOnce;
}
+ (instancetype)cellGetWithTableView: (UITableView *)tableView Style:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
   SWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell){
        cell = [[SWTableViewCell alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    if (self.layoutSubViewEndDoBlock_onlyOnce && !_is_first_run_layoutSubViewEndDoBlock_onlyOnce){
        self.layoutSubViewEndDoBlock_onlyOnce(self);
        self.layoutSubViewEndDoBlock_onlyOnce = nil;
        _is_first_run_layoutSubViewEndDoBlock_onlyOnce = YES;
    }
    if (self.layoutSubViewEndDoBlock) {
        self.layoutSubViewEndDoBlock(self);
    }
}

- (void)i_layoutSubViewsEndDo_onlyOnce:(SWVoidBlock_id)block
{
    self.layoutSubViewEndDoBlock_onlyOnce = block;
}
- (void)i_layoutSubViewsEndDo:(SWVoidBlock_id)block
{
    self.layoutSubViewEndDoBlock = block;
}
- (void)i_layoutSubViewsEndDo_onlyOnce:(SWVoidBlock_id)onlyOnceBlock everyTime:(SWVoidBlock_id)everyTime{
    self.layoutSubViewEndDoBlock_onlyOnce = onlyOnceBlock;
    self.layoutSubViewEndDoBlock = everyTime;
}
@end
