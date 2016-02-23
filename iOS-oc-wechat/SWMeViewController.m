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
    [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)]; //分割线到图片下方对其
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
    if (section==0) return 12.0f;
    return 5.0f;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 22.0f;
//}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) return 66.0f;
    return 44.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWTableViewCell *cell = [SWTableViewCell cellGetWithTableView:tableView Style:indexPath.section == 0 ? UITableViewCellStyleSubtitle : UITableViewCellStyleDefault reuseIdentifier:@[@"header", @"tools", @"face", @"setting"][indexPath.section]];
    
    if(indexPath.section == 0){
        cell.imageView.image = [UIImage imageNamed:@"MyHeader.jpg"];
        cell.textLabel.text = @"咫尺天涯";
        cell.detailTextLabel.text = @"微信号:wangsen578595193";
        [cell i_layoutSubViewsEndDo_onlyOnce:^(SWTableViewCell *tableCell) {
            [tableCell.imageView setBorderRadius:5.0f];
            
            UIImageView *qrCode = [[UIImageView alloc] initWithFrame:CGRectMake(tableCell.width - 50, 25, 16, 16)];
            qrCode.image = [UIImage imageNamed:@"MyQRCode"];
            [tableCell.contentView addSubview:qrCode];
            [tableCell setObject:qrCode forMyKey:@"what"];
        } everyTime:^(SWTableViewCell *tableCell) {
            tableCell.imageView.bounds = CGRectMake(0, 0, 44.0f, 44.0f);
            tableCell.imageView.x = 15;
            
            tableCell.textLabel.x = 2 * tableCell.imageView.x + tableCell.imageView.width;
            tableCell.textLabel.y = tableCell.textLabel.y - 2;
            
            tableCell.detailTextLabel.x = tableCell.textLabel.x;
            tableCell.detailTextLabel.y = tableCell.detailTextLabel.y + 2;
            
            UIImageView *qrCode = [tableCell objectForMyKey:@"what"];
            NSLog(@"%@", qrCode);
            
        }];
    }else{
        switch (indexPath.section) {
            case 1:
            {
                cell.imageView.image = @[[UIImage imageNamed:@"MyAlbum"],[UIImage imageNamed:@"MyFavorites"],[UIImage imageNamed:@"MorePurse"],[UIImage imageNamed:@"MyCardPackage"]][indexPath.row];
                cell.textLabel.text = @[@"相册", @"收藏", @"钱包", @"卡包"][indexPath.row];
            }
                break;
            case 2:{
                cell.imageView.image = [UIImage imageNamed:@"MyFace"];
                cell.textLabel.text = @"表情";
                break;
            }
            case 3:{
                cell.imageView.image = [UIImage imageNamed:@"MySetting"];
                cell.textLabel.text = @"设置";
                break;
            }
            default:
                break;
        }
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}



@end
