//
//  SWTableViewCell.m
//  iOS-oc-wechat
//
//  Created by senwang on 16/1/31.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWTableViewCell.h"
#import "UITableViewCell+SWCategory.h"

@interface SWTableViewCell()
// tableview 通过分配内存获取 isCellFromCreated = YES, reused isCellFromCreated = NO， 内部使用，请不要对该属性赋值
@property (nonatomic, readwrite,assign) BOOL isCellFromCreated;

// 存放自定义视图空间 格式 {key: value}
@property (nonatomic, strong) NSMutableDictionary *mDic;

@end

@implementation SWTableViewCell

+ (instancetype)cellGetWithTableView: (UITableView *)tableView Style:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
   SWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell){
        cell = [[SWTableViewCell alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
        cell.isCellFromCreated = YES;
    }else{
        cell.isCellFromCreated = NO;
    }
    return cell;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    if(_i_isDependentEveryTimeBlock){
        if (self.layoutSubViewEndDoBlock) {
            self.layoutSubViewEndDoBlock(self);
        }
    }
    
    if (self.layoutSubViewEndDoBlock_onlyOnce && self.isCellFromCreated){
        self.layoutSubViewEndDoBlock_onlyOnce(self);
    }else{
        self.layoutSubViewEndDoBlock_onlyOnce = nil;
    }
    
    if(!_i_isDependentEveryTimeBlock){
        if (self.layoutSubViewEndDoBlock) {
            self.layoutSubViewEndDoBlock(self);
        }
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

#pragma mark - 对新增空间设置key
- (void) setObject: (NSObject *)object forMyKey:(NSString *)key {
    if (!_mDic) _mDic = [NSMutableDictionary dictionary];
    [_mDic setObject:object forKey:key];
}
- (id) objectForMyKey:(NSString *)key {
   return [_mDic objectForKey:key];
}
@end
