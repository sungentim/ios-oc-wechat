//
//  SWDiscoverViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWDiscoveryViewController.h"

@interface SWDiscoveryViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SWDiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layoutMyViews];
}

- (void)layoutMyViews {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)]; //分割线到图片下方对其
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[@[@1,@2,@2,@2] objectAtIndex:section] intValue];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) return 12.0f;
    return 5.0f;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat
{
    return 44.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWTableViewCell *cell = [SWTableViewCell cellGetWithTableView:tableView Style:UITableViewCellStyleDefault reuseIdentifier:@"discovery_item"];
    
    cell.imageView.image = @[[UIImage imageNamed:@"FriendCircle"],@0, [UIImage imageNamed:@"ScanScan"],[UIImage imageNamed:@"ShakeShake"],[UIImage imageNamed:@"NearPeople"],[UIImage imageNamed:@"CurrentBottle"],[UIImage imageNamed:@"Shopping"],[UIImage imageNamed:@"MoreGame"]][indexPath.section * 2 + indexPath.row];

    cell.textLabel.text = @[@"朋友圈", @"", @"扫一扫", @"摇一摇", @"附近的人",@"漂流瓶", @"购物", @"游戏"][indexPath.section * 2 + indexPath.row];
    
    [cell i_layoutSubViewsEndDo_onlyOnce:^(SWTableViewCell *tableCell) {
        [tableCell.imageView setWidth:25];
        [tableCell.imageView setHeight:25];
    }];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}





@end
