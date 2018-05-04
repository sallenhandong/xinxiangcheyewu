//
//  MessageCenterViewController.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/23.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "MessageCenterViewController.h"
#import "MessageCenterTableViewCell.h"
#import "MessageInfoViewController.h"
@interface MessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@end

@implementation MessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息中心";
    self.view.backgroundColor = navgationColor;
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    self.tableview.dataSource = self;
    self.tableview.delegate  = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = navgationColor;
    [self.view addSubview:self.tableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"MessageCenterTableViewCell" owner:nil options:nil];
        cell = [arr lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageInfoViewController *vc = [[MessageInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (UITableView *)tableview{
//
//    if (!_tableview) {
//
//        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        _tableview.dataSource = self;
//        _tableview.delegate  = self;
//        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [self.view addSubview:_tableview];
//
//    }
//    return _tableview;
//
//}

@end
