//
//  MySelfView.m
//  MemberCarWash
//
//  Created by 哲仁 on 2018/4/23.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import "MySelfView.h"

@implementation MySelfView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"MySelfView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
    
    return self;
}
-(void)tapAction:(UITapGestureRecognizer *)tap{
 
    self.selectViewBlock();
}
@end
