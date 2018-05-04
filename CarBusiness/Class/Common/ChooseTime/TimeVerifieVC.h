//
//  TimeVerifieVC.h
//  cnpcms
//
//  Created by mac on 2017/8/23.
//  Copyright © 2017年 com.xz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^returnBlock)(NSDate *startDate,NSDate *endDate);

@interface TimeVerifieVC : UIViewController
@property(nonatomic,strong)NSDate *startData;
@property(nonatomic,strong)NSDate *endData;
@property(nonatomic,assign)BOOL dateStyle;
@property(nonatomic,copy)returnBlock block;
@end
