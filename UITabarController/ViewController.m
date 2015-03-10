//
//  ViewController.m
//  UITabarController
//
//  Created by hx_leichunxiang on 14-11-24.
//  Copyright (c) 2014年 lcx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
}


- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.hidesBottomBarWhenPushed = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
