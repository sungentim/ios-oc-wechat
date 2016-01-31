//
//  UITableViewCell+TXCategory.h
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (TXCategory)
@property (nonatomic, weak, readonly) UITableView * i_tableView;
@property (nonatomic, weak, readonly) NSIndexPath * i_indexPath;
@end
