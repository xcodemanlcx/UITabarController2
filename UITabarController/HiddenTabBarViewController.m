//
//  HiddenTabBarViewController.m
//  UITabarController
//
//  Created by hx_leichunxiang on 14-11-29.
//  Copyright (c) 2014年 lcx. All rights reserved.
//

#import "HiddenTabBarViewController.h"

@interface HiddenTabBarViewController ()

@end

@implementation HiddenTabBarViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;//视图控制器实例化时，才有效。

    }
    return self;
}

- (void)loadView
{
    [super loadView];
    CGRect frame = self.view.frame;
    frame.size.height += 49;
    self.view.frame = frame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.title = @"hiddenTabBar";
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
