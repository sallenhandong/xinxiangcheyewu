//
//  SalesHomeViewController.m
//  CarBusiness
//
//  Created by 哲仁 on 2018/5/3.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "SalesHomeViewController.h"
#import "AppDelegate.h"
#import "MessageCenterViewController.h"

#import "MJCSegmentInterface.h"
#import "SalesWaitingListViewController.h"
#import "SalesOngongingListViewController.h"
#import "SalesConfirmListViewController.h"
#import "SalesCompleteListViewController.h"
@interface SalesHomeViewController ()<MJCSegmentDelegate>

@end

@implementation SalesHomeViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = navgationColor;
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 30, 30);
    [menuBtn setImage:[UIImage imageNamed:@"menu_icon"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    messageBtn.frame = CGRectMake(0, 0, 30, 30);
    [messageBtn setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(messageCenterButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:messageBtn];
    
    SalesWaitingListViewController *waitingListVC = [[SalesWaitingListViewController alloc] init];
    SalesOngongingListViewController *ongoingListVC = [[SalesOngongingListViewController alloc] init];
    SalesConfirmListViewController *confirmListVC = [[SalesConfirmListViewController alloc] init];
    SalesCompleteListViewController *completListVC = [[SalesCompleteListViewController alloc] init];
    NSArray *vcArr = @[waitingListVC,ongoingListVC,confirmListVC,completListVC];
    NSArray *titlesArr = @[@"待接单",@"进行中",@"待确认",@"已完成"];
    
    MJCSegmentInterface *lala = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT-64) Styles:MJCTitlesClassicStyle];
    lala.titlesViewFrame = CGRectMake(0,0,SCREEN_WIDTH,50);//顶部标题栏frame
    lala.indicatorStyles = MJCIndicatorItemCenterStyle;
    lala.defaultShowItemCount = 4;//首页,第一页展示多少个
    lala.delegate = self;
    lala.titlesViewBackColor = navgationColor;//标题栏背景颜色
    lala.itemTextFontSize = 15;//item文字大小
    lala.itemTextNormalColor = lightGray_color;//item普通状态下文字颜色
    lala.itemTextSelectedColor = white_color;//item点击状态下文字颜色
    lala.itemBackColor = navgationColor_2;//item背景颜色
    lala.indicatorHidden = NO;//底部指示器是否隐藏
    lala.isChildScollEnabled = YES;//是否手拽滚动子界面
    lala.isChildScollAnimal = YES;//子界面切换是否有动画效果
    lala.isIndicatorFollow = YES;//底部指示器是否随着滑动而跟随
    lala.indicatorColor = white_color;
    lala.isIndicatorsAnimals = YES;
    lala.imageEffectStyles = MJCImageClassicStyle;//item图片类型
    lala.itemImagesEdgeInsets = UIEdgeInsetsMake(10,0,10,0);//item图片位置修改
    lala.itemTextsEdgeInsets = UIEdgeInsetsMake(10,10,10,10);//item文字位置修改
    lala.isFontGradient = YES;//是否渐变
    [lala tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:17];//是否同意字体放大
    [self.view addSubview:lala];
    [lala intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}
- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}
- (void) messageCenterButton{
    
    MessageCenterViewController *vc = [[MessageCenterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
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
