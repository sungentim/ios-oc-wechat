//
//  SWConsultSearchNavigationController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/2/2.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWConsultSearchNavigationController.h"

@interface SWConsultSearchNavigationController ()
{
    UISearchBar *_searchBar;
}
@end

@implementation SWConsultSearchNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"search";
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    _searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, kkScreenWidth, 44.0)];
    _searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _searchBar.keyboardType=UIKeyboardTypeDefault;
    _searchBar.backgroundColor=[UIColor clearColor];
    _searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
    _searchBar.placeholder=@"搜索";
    _searchBar.barStyle=UIBarStyleDefault;
//    _searchBar.delegate=self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"should beginning----");

    return YES;
}
@end
