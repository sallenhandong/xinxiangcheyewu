//
//  CALayer+Addition.m
//  Baili
//
//  Created by xabaili on 16/6/14.
//  Copyright © 2016年 Baili. All rights reserved.
//

#import "CALayer+Addition.h"
#import <objc/runtime.h>

@implementation CALayer (Addition)
//static const void *borderColorFromUIColorKey = &borderColorFromUIColorKey;
//@dynamic borderColorFromUIColor;

- (UIColor *)borderColorFromUIColor {
    
    return objc_getAssociatedObject(self, @selector(borderColorFromUIColor));
    
}

-(void)setBorderColorFromUIColor:(UIColor *)color

{
    objc_setAssociatedObject(self, @selector(borderColorFromUIColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBorderColorFromUI:self.borderColorFromUIColor];
}

- (void)setBorderColorFromUI:(UIColor *)color

{
    self.borderColor = color.CGColor;
    //    NSLog(@"%@", color);
}


@end
