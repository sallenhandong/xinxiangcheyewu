//
//  SettingViewController.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/23.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "SettingViewController.h"
#import "CBNavigationController.h"
#import "LoginViewController.h"

#import "LoginPasswordViewController.h"
#import "BindingPhoneNumberViewController.h"
#import "HelpAndFeedbackViewController.h"
#import "AboutUsViewController.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = navgationColor;
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 312)];
    self.tableview.dataSource = self;
    self.tableview.delegate  = self;
    //    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = navgationColor;
    self.tableview.scrollEnabled = NO;
    [self.view addSubview:self.tableview];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 2;
    }else if (section == 1){
        
        return 3;
    }else{
        
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 10;
    }else if (section == 1){
        
        return 1;
    }else{
        
        return 1;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    int heightForHeader;
    if (section == 0) {
        
        heightForHeader = 10;
    }else if (section == 1){
        
        heightForHeader = 1;
    }else{
        
        heightForHeader = 1;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, heightForHeader)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *textArray = @[@[@"登陆密码",@"绑定手机号"],@[@"帮助与反馈",@"关于我们",@"版权声明"],@[@"缓存清理"]];
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    cell.backgroundColor = navgationColor;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = textArray[indexPath.section][indexPath.row];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            LoginPasswordViewController *vc = [[LoginPasswordViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            
            BindingPhoneNumberViewController *vc = [[BindingPhoneNumberViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            
            HelpAndFeedbackViewController *vc = [[HelpAndFeedbackViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else if (indexPath.row == 1) {
            
            AboutUsViewController *vc = [[AboutUsViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            
        }
    }else{
        
        CGFloat folderSize = [self folderSize];
        // 初始化对话框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"发现%.2fM缓存,您确认要清除吗？",folderSize] preferredStyle:UIAlertControllerStyleAlert];
        // 确定注销
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        
            [self clearFile];
        }];
        
        UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:okAction];
        [alert addAction:cancelAction];
        // 弹出对话框
        [self presentViewController:alert animated:true completion:nil];
    }
    
}
- (IBAction)logOutButton:(id)sender {
    
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

}

- (void)clearFile{
    
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory , NSUserDomainMask , YES ) firstObject];
    NSArray * files = [[NSFileManager defaultManager ] subpathsAtPath :cachePath];
    //NSLog ( @"cachpath = %@" , cachePath);
    for ( NSString * p in files) {
        
        NSError * error = nil ;
        //获取文件全路径
        NSString * fileAbsolutePath = [cachePath stringByAppendingPathComponent :p];
        
        if ([[NSFileManager defaultManager ] fileExistsAtPath :fileAbsolutePath]) {
            [[NSFileManager defaultManager ] removeItemAtPath :fileAbsolutePath error :&error];
        }
    }
    
}
- (CGFloat)folderSize{
    
    CGFloat folderSize = 0.0;
    //获取路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    
    //获取所有文件的数组
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%ld",files.count);
    
    for(NSString *path in files) {
        
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        
        //累加
        folderSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    //转换为M为单位
    CGFloat sizeM = folderSize /1024.0/1024.0;
    
    return sizeM;
}
@end
