//
//  OperatLeftViewController.m
//  CarBusiness
//
//  Created by 哲仁 on 2018/5/3.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "OperatLeftViewController.h"
#import "AppDelegate.h"
#import "MySelfView.h"
#import "MySelfInfoViewController.h"

#import "OperatStatisticalViewController.h"
#import "OperatHistoricalDataViewController.h"
#import "MessageCenterViewController.h"

#import "CBNavigationController.h"
#import "LoginViewController.h"
#define HeightForHeader 160
#define HeightForFoot SCREEN_HEIGHT - 340
@interface OperatLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation OperatLeftViewController

- (UITableView *)tableview{

    if (!_tableview) {
        _tableview = [[UITableView alloc] init];
        _tableview.frame = self.view.bounds;
        _tableview.dataSource = self;
        _tableview.delegate  = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.scrollEnabled = NO;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = navgationColor_2;
    [self tableview];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:17.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"统计"];
        cell.textLabel.text = @"统计数据";
    } else if (indexPath.row == 1) {
        cell.imageView.image = [UIImage imageNamed:@"异常反馈"];
        cell.textLabel.text = @"历史记录";
    } else {
        cell.imageView.image = [UIImage imageNamed:@"消息"];
        cell.textLabel.text = @"消息中心";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    if (indexPath.row == 0) {
    
        OperatStatisticalViewController *vc = [[OperatStatisticalViewController alloc] init];
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
    
        OperatHistoricalDataViewController *vc = [[OperatHistoricalDataViewController alloc] init];
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:YES];
        
    }else{
        
        MessageCenterViewController *vc = [[MessageCenterViewController alloc] init];
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:YES];
    }
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HeightForHeader;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    MySelfView *view = [[MySelfView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, HeightForHeader)];
    view.selectViewBlock = ^{
        
        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        MySelfInfoViewController *vc = [[MySelfInfoViewController alloc] init];
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:YES];
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    };
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   
    return HeightForFoot;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, HeightForFoot)];
    
    UILabel *lineLable = [[UILabel alloc] initWithFrame:CGRectMake(15, HeightForFoot - 49, self.tableview.bounds.size.width - 15, 1)];
    lineLable.backgroundColor = white_color;
    [view addSubview:lineLable];
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, HeightForFoot - 50, self.tableview.bounds.size.width, 50);
    [button setTitle:@"退出登录" forState:UIControlStateNormal];
    button.titleLabel.font = H17;
    [button setTitleColor:white_color forState:UIControlStateNormal];
    [button addTarget:self action:@selector(logOutButton) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (void)logOutButton{
    
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要退出登陆吗？" preferredStyle:UIAlertControllerStyleAlert];
    // 确定注销
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        CBNavigationController *mainNavigationController = [[CBNavigationController alloc] initWithRootViewController:loginVC];
        mainNavigationController.navigationBar.barTintColor = navgationColor;
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        window.rootViewController = mainNavigationController;
    }];
    
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
