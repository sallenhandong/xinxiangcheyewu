//
//  BindingPhoneNumberViewController.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/25.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "BindingPhoneNumberViewController.h"
#import "BindingPhoneNumberNextViewController.h"
@interface BindingPhoneNumberViewController ()

@end

@implementation BindingPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"绑定手机号";
    self.view.backgroundColor = navgationColor;
}
- (IBAction)nextButton:(id)sender {
    
    BindingPhoneNumberNextViewController *vc = [[BindingPhoneNumberNextViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
