//
//  CALayer+Addition.h
//  Baili
//
//  Created by xabaili on 16/6/14.
//  Copyright © 2016年 Baili. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Addition)

@property(nonatomic, strong) UIColor *borderColorFromUIColor;
- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
