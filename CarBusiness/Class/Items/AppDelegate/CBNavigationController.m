//
//  CBNavigationController.m
//  CarBusiness
//
//  Created by 哲仁 on 2018/5/3.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "CBNavigationController.h"

@interface CBNavigationController ()

@end

@implementation CBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    //标题字体大小,颜色
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //导航背景颜色
    self.navigationBar.barTintColor = navgationColor_2;
}
-(void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated{
    
    [super pushViewController:viewController animated:animated];
    
    //NavigationController中包含的第一个UIViewController也是push方法进来的 但是一般这个controller不需要添加back button
    
    if(self.viewControllers.count>1) {
        
        UIButton*backButton=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [backButton setImage:[UIImage imageNamed:@"back_icon"]forState:UIControlStateNormal];
        
        [backButton setImage:[UIImage imageNamed:@"back_icon"]forState:UIControlStateHighlighted];
        
        backButton.frame=CGRectMake(0,0,30,30);
        
        [backButton addTarget:self action:@selector(back)forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backButton];
        
    }
}

//back方法

-(void)back{
    
    [self popViewControllerAnimated:YES];
    
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
