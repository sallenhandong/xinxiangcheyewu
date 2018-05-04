//
//  AboutUsViewController.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/25.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "AboutUsViewController.h"
#import "MySelfInfoTableViewCell.h"
@interface AboutUsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    self.view.backgroundColor = navgationColor;
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 284, SCREEN_WIDTH, 100)];
    self.tableview.dataSource = self;
    self.tableview.delegate  = self;
    //    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = navgationColor;
    self.tableview.scrollEnabled = NO;
    [self.view addSubview:self.tableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *titleArray = @[@"联系电话",@"官方网址"];
    NSArray *contentArray = @[@"12580",@"www.zheren.com"];
    
    MySelfInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"MySelfInfoTableViewCell" owner:nil options:nil];
        cell = [arr lastObject];
    }
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.contentLabel.text = contentArray[indexPath.row];
    cell.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    cell.contentLabel.font = [UIFont systemFontOfSize:17.0f];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = navgationColor;
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1) {
        
       NSString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"15291840578"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
    }else{
        
        
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
