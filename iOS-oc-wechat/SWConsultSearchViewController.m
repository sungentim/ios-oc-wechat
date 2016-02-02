//
//  SWConsultSearchViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/2/2.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWConsultSearchViewController.h"

@interface SWConsultSearchViewController ()<UISearchBarDelegate>
{
    UITableView *_tableView;
    UISearchBar *_searchBar;
}
@end

@implementation SWConsultSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
    
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    tableView.y = 20;
//    _tableView = tableView;
//    _tableView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:tableView];
    
    _searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 20.0, kkScreenWidth, 44.0)];
    _searchBar.showsCancelButton = YES;
    _searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _searchBar.keyboardType=UIKeyboardTypeDefault;
    _searchBar.backgroundColor=[UIColor clearColor];
//    _searchBar.barTintColor = [UIColor colorWithHexString:@"f2f2f2"];
    _searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
    _searchBar.placeholder=@"搜索";
    _searchBar.barStyle=UIBarStyleDefault;
    _searchBar.delegate=self;
    [self.view addSubview:_searchBar];
    
    [self setStatusBarBgColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_searchBar becomeFirstResponder];
}

#pragma mark - searBar
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"should beginning...");
    
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)setStatusBarBgColor {
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kkScreenWidth, 20)];
    statusBarView.backgroundColor= [UIColor colorWithHexString:@"c9c9ce"];
    [self.view addSubview:statusBarView];
}

@end
