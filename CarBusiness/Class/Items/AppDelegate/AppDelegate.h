//
//  AppDelegate.h
//  CarBusiness
//
//  Created by 哲仁 on 2018/5/3.
//  Copyright © 2018年 哲仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CBNavigationController.h"
#import "LeftSlideViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) CBNavigationController *mainNavigationController;
- (void)saveContext;
@end

