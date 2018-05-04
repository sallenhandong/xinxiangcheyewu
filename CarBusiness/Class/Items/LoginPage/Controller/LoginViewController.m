//
//  LoginViewController.m
//  CarBusiness
//
//  Created by 哲仁 on 2018/5/3.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "CBNavigationController.h"
#import "LeftSlideViewController.h"

#import "OperatLeftViewController.h"
#import "OperatHomeViewController.h"

#import "SalesLeftViewController.h"
#import "SalesHomeViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *operatButton;
@property (weak, nonatomic) IBOutlet UIButton *salesButton;
@property (nonatomic, assign)BOOL isOperat;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登陆";
    
    [self.operatButton setTitleColor:navgationColor_2 forState:UIControlStateNormal];
    self.operatButton.titleLabel.font = H17;

    [self.salesButton setTitleColor:white_color forState:UIControlStateNormal];
    self.salesButton.titleLabel.font = H15;
    
    self.isOperat = NO;
    
}
- (IBAction)professionalButton:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    if (button.tag == 11) {
        
        self.isOperat = NO;
        [self.operatButton setTitleColor:navgationColor_2 forState:UIControlStateNormal];
        self.operatButton.titleLabel.font = H17;
        [self.salesButton setTitleColor:white_color forState:UIControlStateNormal];
        self.salesButton.titleLabel.font = H15;
    }else{
        
        self.isOperat = YES;
        [self.salesButton setTitleColor:navgationColor_2 forState:UIControlStateNormal];
        self.salesButton.titleLabel.font = H17;
        [self.operatButton setTitleColor:white_color forState:UIControlStateNormal];
        self.operatButton.titleLabel.font = H15;
    }

}
- (IBAction)loginButton:(id)sender {
    
    if (self.isOperat == NO) {
       
        OperatHomeViewController *OperatHomeVC = [[OperatHomeViewController alloc] init];
        CBNavigationController *mainNavigationController = [[CBNavigationController alloc] initWithRootViewController:OperatHomeVC];

       OperatLeftViewController *OperatLeftVC = [[OperatLeftViewController alloc] init];
        LeftSlideViewController *LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:OperatLeftVC andMainView:mainNavigationController];
    
        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        tempAppDelegate.LeftSlideVC = LeftSlideVC;
        tempAppDelegate.mainNavigationController = mainNavigationController;
    
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        window.rootViewController = LeftSlideVC;
    }else{
        
        SalesHomeViewController *SalesHomeVC = [[SalesHomeViewController alloc] init];
        CBNavigationController *mainNavigationController = [[CBNavigationController alloc] initWithRootViewController:SalesHomeVC];
        
        SalesLeftViewController *SalesLeftVC = [[SalesLeftViewController alloc] init];
        LeftSlideViewController *LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:SalesLeftVC andMainView:mainNavigationController];
        
        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        tempAppDelegate.LeftSlideVC = LeftSlideVC;
        tempAppDelegate.mainNavigationController = mainNavigationController;
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        window.rootViewController = LeftSlideVC;
        
    }
    
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
