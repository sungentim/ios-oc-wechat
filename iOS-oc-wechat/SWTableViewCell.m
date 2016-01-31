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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
   
    if (self.i_tableView) {
        return [self.i_tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    }
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    if (self.layoutSubViewEndDoBlock) {
        self.layoutSubViewEndDoBlock(self);
    }
    
}

- (void)i_layoutSubViewsEndDo:(SWVoidBlock_id)block
{
    self.layoutSubViewEndDoBlock = block;
}

@end
