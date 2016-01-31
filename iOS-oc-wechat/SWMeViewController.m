//
//  SWMeViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWMeViewController.h"

@interface SWMeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SWMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layoutMyViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutMyViews {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[@[@1,@4,@1,@1] objectAtIndex:section] intValue];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) return 18.0f;
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 22.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWBorderTableViewCell *cell = [[SWBorderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@[@"header", @"tools", @"face", @"setting"][indexPath.section]];
    
    
    if(indexPath.section == 0){
        
    }else{
        NSInteger array_index = indexPath.section + indexPath.row - 1;
        cell.imageView.image = @[[UIImage imageNamed:@"MyAlbum"],[UIImage imageNamed:@"MyFavorites"],[UIImage imageNamed:@"MorePurse"],[UIImage imageNamed:@"MyCardPackage"],[UIImage imageNamed:@"MyFace"],[UIImage imageNamed:@"MySetting"]][array_index];
        cell.textLabel.text = @[@"相册", @"收藏", @"钱包", @"卡包", @"表情", @"设置"][array_index];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}



@end
