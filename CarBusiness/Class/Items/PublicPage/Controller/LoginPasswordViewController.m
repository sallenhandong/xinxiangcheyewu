//
//  LoginPasswordViewController.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/25.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "LoginPasswordViewController.h"
//#import "ForgetPassWordViewController.h"
@interface LoginPasswordViewController ()

@end

@implementation LoginPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登陆密码";
    self.view.backgroundColor = navgationColor;
    
    UIButton *forgetPwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwBtn.frame = CGRectMake(0, 0, 20, 18);
    [forgetPwBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPwBtn.titleLabel.font = H15;
    [forgetPwBtn addTarget:self action:@selector(forgetPasswordButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:forgetPwBtn];
}
- (void)forgetPasswordButton{
    
//    ForgetPassWordViewController *vc = [[ForgetPassWordViewController alloc] init];
//    vc.pushWay = PushWayMySelf;
//    [self.navigationController pushViewController:vc animated:YES];
    
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
