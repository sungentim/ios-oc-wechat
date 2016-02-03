//
//  SWConsultViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWConsultViewController.h"

#import "SWBaseNavigationController.h"
#import "SWConsultSearchViewController.h"

#import "UIViewController+SWCategory.h"
#define ktitleSection @[@"",@"☆",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"]
#define kColorBlue [UIColor colorWithRed:0 green:0 blue:200/255 alpha:0.8]
@interface SWConsultViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
    UISearchBar *_searchBar;
    UITableView *_tableView;
    
    UIButton *_btn;//滑动显示按钮ABCDE。。。
}
@end

@implementation SWConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //   设置导航条
    [self setNavigationBar];
    
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
    
    // 设置 搜索栏
    [self addSearchBar];
}

#pragma mark - 设置导航条
- (void)setNavigationBar {
    [self i_setRightBarButtonWithImage:[UIImage imageNamed:@"consult_barbutton_add_friend"] target:self action:@selector(rightBarButtonClick)];
}
- (void)rightBarButtonClick {
    NSLog(@"%@", @"bar button click");
}

#pragma mark - searchBar相关 begin
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

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"should beginning");
//    [self.navigationController setNavigationBarHidden:YES];
    SWConsultSearchViewController *consultSearchCtrl = [[SWConsultSearchViewController alloc] init];
    SWBaseNavigationController *baseNav = [[SWBaseNavigationController alloc] initWithRootViewController:consultSearchCtrl];
    [self presentViewController:baseNav animated:NO completion:nil];
    
    return YES;
}


#pragma mark - tableView相关代理
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
            cell.textLabel.text = @[@"新的朋友", @"群聊", @"标签", @"公众号"][indexPath.row + 10];
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

    NSInteger count = 0;
    for(NSString *character in ktitleSection)
    {
        if([character isEqualToString:title])
        {
            [self createIndexBtn:title];
            return count;
        }
        count ++;
    }
    return 0;
}
#pragma mark -滑动到某个字母显示一个大按钮
-(void)createIndexBtn:(NSString *)title
{
    if (_btn == nil) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 210, 50, 50)];
        _btn.backgroundColor = kColorBlue;
        _btn.layer.cornerRadius = 5;
        [_btn setAlpha:0.7];
    }
    [_btn setTitle:title forState:UIControlStateNormal];
    
    [self.view addSubview:_btn];
    
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(removeBtn) object:nil];
    [self performSelector:@selector(removeBtn) withObject:nil afterDelay:0.5];
}
-(void)removeBtn
{
    
    [UIView animateWithDuration:0.5 animations:^{
        _btn.alpha = 0;
    } completion:^(BOOL finished) {
        _btn.alpha = 0.7;
        [_btn removeFromSuperview];
    }];
    
}







@end
