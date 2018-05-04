//
//  HelpAndFeedbackViewController.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/25.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "HelpAndFeedbackViewController.h"

@interface HelpAndFeedbackViewController ()

@end

@implementation HelpAndFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"帮助与反馈";
    self.view.backgroundColor = navgationColor;
}
- (IBAction)selectButton:(id)sender {
    
    for (int i = 11; i<14; i++) {
        
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = NO;
    }
    UIButton *button = (UIButton *)sender;
    button.selected = YES;
    
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
