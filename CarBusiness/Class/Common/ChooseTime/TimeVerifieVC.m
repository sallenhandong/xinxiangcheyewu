//
//  TimeVerifieVC.m
//  cnpcms
//
//  Created by mac on 2017/8/23.
//  Copyright © 2017年 com.xz. All rights reserved.
//

#import "TimeVerifieVC.h"

#import "WSDatePickerView.h"

@interface TimeVerifieVC ()
{
    ///获取当前时间
    NSDate *nowTime;

}

@property (weak, nonatomic) IBOutlet UIButton *beginBtu;
@property (weak, nonatomic) IBOutlet UIButton *endBtu;
@property (weak, nonatomic) IBOutlet UIButton *okBtu;

- (IBAction)selectTime:(UIButton *)sender;
- (IBAction)OkAction:(UIButton *)sender;

@end

@implementation TimeVerifieVC

///跳转
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    
    self.okBtu.layer.cornerRadius = 5;
    //设置颜色
    self.okBtu.layer.borderColor = orange_color.CGColor;
    self.okBtu.layer.borderWidth = 1;

    self.endBtu.layer.cornerRadius = 5;
    //设置颜色
    self.endBtu.layer.borderColor = orange_color.CGColor;
    self.endBtu.layer.borderWidth = 1;
    self.endBtu.tag=202;

    self.beginBtu.layer.cornerRadius = 5;
    //设置颜色
    self.beginBtu.layer.borderColor = orange_color.CGColor;
    self.beginBtu.layer.borderWidth = 1;
    self.beginBtu.tag=201;
    
    nowTime = [NSDate date];

    if (self.dateStyle == NO) {
        ///获取当前时间
        [self.beginBtu setTitle:[self.startData stringWithFormat:@"yyyy-MM-dd"] forState:UIControlStateNormal];
        [self.endBtu setTitle:[self.endData stringWithFormat:@"yyyy-MM-dd"] forState:UIControlStateNormal];
    }else{
        ///获取当前时间
        [self.beginBtu setTitle:[self.startData stringWithFormat:@"yyyy-MM-dd HH:mm"] forState:UIControlStateNormal];
        [self.endBtu setTitle:[self.endData stringWithFormat:@"yyyy-MM-dd HH:mm"] forState:UIControlStateNormal];
    }
  
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


///选择时间
- (IBAction)selectTime:(UIButton *)sender {
    
    if (self.dateStyle == NO) {
        
        WSDatePickerView *datepicker=[[WSDatePickerView alloc] initWithDate:DateStyleShowYearMonthDay StartTime:nil endTime:nowTime CompleteBlock:^(NSDate * time) {
            NSComparisonResult resultCompar;
            BOOL isOK=NO;
            if (sender.tag==201) {
                ///开始时间
                resultCompar=[time compare:self.endData];
                if(resultCompar == NSOrderedSame){
                    isOK=YES;
                }
                else if (resultCompar ==NSOrderedDescending) {
                    isOK=NO;
                }
                else{
                    isOK=YES;
                }
            
            }
            else{
                ///结束时间
                resultCompar=[time compare:self.startData];
                if(resultCompar == NSOrderedSame){
                    isOK=YES;
                }
                else if (resultCompar ==NSOrderedDescending) {
                    isOK=YES;
                }
                else{
                    isOK=NO;
                }

            }
            
            if(isOK){
                if (sender.tag==201) {
                    ///开始时间
                    self.startData = time;
                }
                else{
                    ///结束时间
                    self.endData = time;
                }
                NSString *date = [time stringWithFormat:@"yyyy-MM-dd"];
                NSLog(@"时间： %@",date);
                [sender setTitle:date forState:UIControlStateNormal];
            }
        }];
        datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
        
        [datepicker show];

    }else{
        
        WSDatePickerView *datepicker=[[WSDatePickerView alloc] initWithDate:DateStyleShowYearMonthDayHourMinute StartTime:nil endTime:nowTime CompleteBlock:^(NSDate * time) {
            NSComparisonResult resultCompar;
            BOOL isOK=NO;
            if (sender.tag==201) {
                ///开始时间
                resultCompar=[time compare:self.endData];
                if(resultCompar == NSOrderedSame){
                    isOK=YES;
                }
                else if (resultCompar ==NSOrderedDescending) {
                    isOK=NO;
                }
                else{
                    isOK=YES;
                }
            }
            else{
                ///结束时间
                resultCompar=[time compare:self.startData];
                if(resultCompar == NSOrderedSame){
                    isOK=YES;
                }
                else if (resultCompar ==NSOrderedDescending) {
                    isOK=YES;
                }
                else{
                    isOK=NO;
                }
            }
            
            if(isOK){
                if (sender.tag==201) {
                    ///开始时间
                    self.startData=time;
                }
                else{
                    ///结束时间
                    self.endData=time;
                }
                NSString *date = [time stringWithFormat:@"yyyy-MM-dd HH:mm"];
                NSLog(@"时间： %@",date);
                [sender setTitle:date forState:UIControlStateNormal];
            }
        }];
        datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
        
        [datepicker show];
        
    }
 

}


///点击ok的按钮事件
- (IBAction)OkAction:(UIButton *)sender {
    self.block(self.startData,self.endData);
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
