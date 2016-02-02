//
//  SWBaseViewController.m
//  iOS-oc-wechat
//
//  Created by winter on 16/1/30.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWBaseViewController.h"
#import "UIViewController+SWCategory.h"
@implementation SWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 设置导航栏文标题字颜色和字体大小
    [self i_setTitleText:self.title Color:[UIColor whiteColor] font:[UIFont systemFontOfSize:17]];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 选中某个tableview中的选项 自动取消选中状态
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//设置状态栏文字为白色 如果viweController在navigationController中则需要写到navigationController中
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
