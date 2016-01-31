//
//  UITableViewCell+TXCategory.m
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UITableViewCell+SWCategory.h"
#import "UIView+SWCategory.h"
@implementation UITableViewCell (TXCategory)
@dynamic i_tableView;
@dynamic i_indexPath;
/**
 *  获取该cell所属的tableView
 *
 *  @return tableView对象
 */
- (UITableView *)i_tableView
{
    return (UITableView *)[self i_superview_withSuperClassType:[UITableView class]];
}
/**
 *  cell 所在tableView的IndexPath
 *
 *  @return 返回indexpath
 */
- (NSIndexPath *)i_indexPath
{
	return [self.i_tableView indexPathForCell:self];
}
@end
