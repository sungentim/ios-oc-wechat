//
//  TXBaseViewController.m
//  appDoctor
//
//  Created by TX-009 on 14-10-28.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "TXBaseViewController.h"
#import "UIColor+TXCategory.h"
#import "UIViewController+TXCategory.h"
#import <MBProgressHUD.h>
#import "WSNavButton.h"
#import "UIView+TXCategory.h"
#import "AppDelegate.h"
#import "MypatienMainViewController.h"
#import "PatientMessageMainViewController.h"
static MBProgressHUD *HUD;
@interface TXBaseViewController ()

@end
@implementation TXBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _patientInfo = [[ModelPatientInfo alloc] init];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
    if ([[TXCommonMessage sharedTXCommonMessage] isExpMode]) {
        [self setMyExpModeView];
    }
    else
    {
        if(expModeButton)
        {
            [expModeButton removeFromSuperview];
            expModeButton = nil;
        }
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (tempButton) {
        [tempButton removeFromSuperview];
        tempButton = nil;
    }
    
}
static CGFloat expViewHeight = 40;
static TXButton *expModeButton;
static TXButton *tempButton;
- (void)setMyExpModeView
{
    if (expModeButton) {
        tempButton = expModeButton;
        expModeButton = nil;
    }
    if (expModeButton == nil) {
        expModeButton = [[TXButton alloc] initWithFrame:CGRectMake(0, 0, self.view.width, expViewHeight)];
        [expModeButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [expModeButton setImage:[UIImage imageNamed:@"D50-left_03"] forState:UIControlStateNormal];
        expModeButton.imageViewFrame = CGRectMake(47, 10, 40, 20);
        expModeButton.titleLabelFrame = CGRectMake(expModeButton.imageViewFrame.origin.x + expModeButton.imageViewFrame.size.width, 10, 200, 20);
        [expModeButton setTitle:@"注册？点击退出体验模式" forState:UIControlStateNormal];
        [expModeButton.titleLabel setFont:[UIFont systemFontOfSize:15.5]];
        [expModeButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [expModeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [expModeButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [expModeButton setBackgroundColor:[UIColor tx_colorWithHexString:@"ff8800"]];
        
        [self.view addSubview:expModeButton];
        
//        [[kkTXAppDelegate window] addSubview:expModeButton];
        [expModeButton addTarget:self action:@selector(expBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
//    [expModeButton setHeight:expViewHeight];
//    
//    [self.view setY:64 + expViewHeight];
//    [self.view setHeight:viewHeight - expViewHeight];
    
//    static BOOL isFirstInPatientList;
//    if ([self isKindOfClass:[MypatienMainViewController class]] && !isFirstInPatientList) {
//        static BOOL isNoFirstHere;
//        if (!isNoFirstHere) {
//            isFirstInPatientList = YES;
//            isNoFirstHere = YES;
//        }
//        
//    }
//    if ([self isKindOfClass:[PatientMessageMainViewController class]] && isFirstInPatientList) {
//        [self.view setHeight:viewHeight];
//        isFirstInPatientList = NO;
//    }
    
    NSArray *subViews = [self.view subviews];
    for (UIView *subview in subViews) {
        if ([subview isKindOfClass:[UITableView class]] || [subview isKindOfClass:[TXKeyBoardScrollView class]]) {
            subview.y = expModeButton.height;
            subview.height = self.view.height - expModeButton.height;
        }
    }
    
    
}
- (void)expBtnClick:(UIButton *)btn
{
    NSLog(@"expBtnClick");
    [[TXCommonMessage sharedTXCommonMessage] setIsExpMode:NO];
    [[TXCommonMessage sharedTXCommonMessage] setRememberToken:@""];
    [[TXCommonMessage sharedTXCommonMessage] setExpMode_userName:@""];
    [kkTXAppDelegate initViewController];
}
//screenHeight 去掉naviugationbar 64高度后的 高度
static float viewHeight;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self tx_SetTitleText:self.title Color:[UIColor whiteColor] font:[UIFont systemFontOfSize:17]];
    [self.view setHeight:self.view.height - 64];
    [self.view setY:64];
    
    if (viewHeight == 0) {
        viewHeight = self.view.height;
    }
    
    
    
    // Do any additional setup after loading the view.
    TXKeyBoardScrollView *keyBoardScrollView = [[TXKeyBoardScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:keyBoardScrollView];
    self.keyBoardScrollView = keyBoardScrollView;
    self.keyBoardScrollView.backgroundColor=[UIColor tx_colorWithHexString:@"#efeff4"];
    [self.keyBoardScrollView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    
    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
//    self.view.backgroundColor=[UIColor colorWithHexString:@"#efeff4"];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    if (iOSVersion>=7.0) {
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
//    }else
//    {
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar_lowversion"] forBarMetrics:UIBarMetricsDefault];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
//    {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)beginRequestWithAnimation:(BOOL)hasAnimation
{
    if (hasAnimation) {
        [self showHUD];
    }
}
- (void)successRequestWithAnimation:(BOOL)hasAnimation
{
    if (hasAnimation) {
        [self removeHUD];
    }
}
- (void)failedRequestWithAnimation:(BOOL)hasAnimation showFailedMessage:(NSString *)str;
{
    if (hasAnimation) {
        [self removeHUD];
    }
    if ([str isKindOfClass:[NSString class]]) {
        [TXDropdownAlert title:@"提示" message:str];
    }
}
- (void)errorRequestWithAnimation:(BOOL)hasAnimation
{
    [self removeHUD];
    [TXDropdownAlert title:@"网络请求超时" message:@"请检查您的手机是否可以正常上网"];
}
- (void)showHUD
{
    if (!HUD) {
        //初始化进度框，置于当前的View当中
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        //如果设置此属性则当前的view置于后台
        //HUD.dimBackground = YES;
        [HUD setMode:MBProgressHUDModeIndeterminate];
        [HUD show:YES];
    }
}
- (void)removeHUD
{
    [HUD removeFromSuperview];
    HUD = nil;
}

#pragma mark -设置导航栏左侧按钮
///返回
- (void)setBackBarButtonWithTitle:(NSString *)title
{
    WSNavButton *leftButton=[[WSNavButton alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [leftButton addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [leftButton setImage:[UIImage imageNamed:@"LeftButtonInd"] forState:UIControlStateNormal];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem=buttonItem;
}
- (void)popBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -设置导航栏右侧按钮
- (void)setRightBarButtonWithtarget:(id)target action:(SEL)action title:(NSString *)title
{
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action]];
}
@end
