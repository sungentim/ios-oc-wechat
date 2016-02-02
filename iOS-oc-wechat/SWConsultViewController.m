//
//  SWConsultViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWConsultViewController.h"
#define ktitleSection @[@"",@"☆",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"]
@interface SWConsultViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
    UISearchBar *_searchBar;
    UITableView *_tableView;
}
@end

@implementation SWConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // ios7的UITableVIew按字母排序的索引改成背景透明
    if ([_tableView respondsToSelector:@selector(setSectionIndexColor:)]) {
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
    }
    
    [self addSearchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// searchBar相关 begin
- (void) addSearchBar{
    _searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, kkScreenWidth, 44.0)];
    _searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _searchBar.keyboardType=UIKeyboardTypeDefault;
    _searchBar.backgroundColor=[UIColor clearColor];
    _searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
    _searchBar.placeholder=@"搜索";
    _searchBar.barStyle=UIBarStyleDefault;
    _searchBar.delegate=self;
    _tableView.tableHeaderView=_searchBar;
}
// searchBar相关 end



-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return ktitleSection;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 ) return 0.0f;
    return 20.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 20)];
    view.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 4, self.view.width,12)];
    [label setFont:[UIFont systemFontOfSize:14]];
    label.textColor = [UIColor grayColor];
    label.text = ktitleSection[section];
    [view addSubview:label];
    return view;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return ktitleSection[section];
//}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return ktitleSection.count;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 4;
            break;
        default:
            return 1;
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWTableViewCell *cell = [SWTableViewCell cellGetWithTableView:tableView Style:UITableViewCellStyleDefault reuseIdentifier:@"consultItem"];
    switch (indexPath.section) {
        case 0:{
            NSLog(@"%zi", indexPath.row);
            cell.imageView.image = @[[UIImage imageNamed:@"plugins_FriendNotify"],[UIImage imageNamed:@"add_friend_icon_addgroup"],[UIImage imageNamed:@"Contact_icon_ContactTag"],[UIImage imageNamed:@"add_friend_icon_offical"]][indexPath.row];
            cell.textLabel.text = @[@"新的朋友", @"群聊", @"标签", @"公众号"][indexPath.row];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
        }
        case 1:{
            cell.imageView.image = @[[UIImage imageNamed:@"MyAlbum"]][0];
            cell.textLabel.text = @[@"星标朋友"][0];
            break;
        }
        default:
        {
            cell.imageView.image = @[[UIImage imageNamed:@"MyAlbum"]][0];
            cell.textLabel.text = @[@"联系人"][0];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
        }
    }
    return cell;
}

//滑动索引执行该方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{

    NSLog(@"%zi", index);
    return 0;
}







@end
