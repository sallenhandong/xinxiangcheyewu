//
//  MySelfInfoViewController.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/24.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "MySelfInfoViewController.h"
#import "MySelfInfoTableViewCell.h"
#import "MySelfInfoImageTableViewCell.h"
@interface MySelfInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@end

@implementation MySelfInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人信息";
    self.view.backgroundColor = navgationColor;
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 210)];
    self.tableview.dataSource = self;
    self.tableview.delegate  = self;
    self.tableview.backgroundColor = navgationColor;
    self.tableview.scrollEnabled = NO;
    [self.view addSubview:self.tableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 60;
    }else{
        
        return 50;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        MySelfInfoImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"MySelfInfoImageTableViewCell" owner:nil options:nil];
            cell = [arr lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
       
    }else{
        
        NSArray *titleArray = @[@"姓名",@"性别",@"工号"];
        NSArray *contentArray = @[@"张三",@"男",@"编号9527"];
        
        MySelfInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"MySelfInfoTableViewCell" owner:nil options:nil];
            cell = [arr lastObject];
        }
        cell.titleLabel.text = titleArray[indexPath.row -1];
        cell.contentLabel.text = contentArray[indexPath.row -1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
