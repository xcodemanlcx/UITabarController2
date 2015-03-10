//
//  MainViewController.m
//  UITabarController
//
//  Created by hx_leichunxiang on 14-11-27.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  内容：自定义UITabBar

#import "MainViewController.h"

static CGFloat const tabBarHeight = 49;
static NSInteger const kBaseTag = 1000;
static NSInteger const itemsCount = 5;
static NSInteger const defaultIndex = 0;

@interface MainViewController ()
{
    UITabBar *customTabBar;
    UIImageView *_selectedImgView;
    CGFloat _tabBarItemBtnW;
}
@end

@implementation MainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //1 设置选中控制器
        self.selectedIndex = defaultIndex;
        //2 自定义tabBar步骤：隐藏系统tabBar，新建UITabBar,设置按钮为其子视图，触发事件时改变self.selectedIndex。
//        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customTabBar];
}

#pragma - mark - 1 完全自定义UITabBar
/*
 1 自定义tabBar思路：创建带事件响应的视图，事件触发时改变self.selectedIndex。
 例子步骤：
*隐藏系统tabBar；
*新建UITabBar, 或者用UIImageView作为背景也可以（但要考虑隐藏UIImageView的问题，而UITabBar不用考虑隐藏的问题）；
*UITabBar添加按钮；
*触发事件时改变tabBar控制器的属性selectedIndex。
*/

- (void)customTabBar{
    customTabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, tabBarHeight)];
    customTabBar.clipsToBounds = YES;
    customTabBar.backgroundImage = [UIImage imageNamed:@"nav_bar_image"];//设置图片型背景
    //    tabbar.tintColor = [UIColor redColor];
//    tabBar.selectionIndicatorImage = [UIImage imageNamed:@"icon_praise_s"];//设置标签选中的UITabBarItem的背景图片。
    [self.view addSubview:customTabBar];
    
    NSArray *titleArr = @[@"1",@"2",@"3",@"4",@"5"];
    _tabBarItemBtnW = customTabBar.frame.size.width/itemsCount;
    _selectedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, _tabBarItemBtnW-20, 49-20)];
    _selectedImgView.backgroundColor = [UIColor purpleColor];
    [customTabBar addSubview:_selectedImgView];
    
    for (int i = 0; i < itemsCount; i++)
    {
        UIButton *tabBarItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBarItemBtn.frame = CGRectMake(_tabBarItemBtnW*i, 20, _tabBarItemBtnW, tabBarHeight-20);
        tabBarItemBtn.tag = kBaseTag+i;
        [tabBarItemBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_back"] forState:UIControlStateNormal];
        [tabBarItemBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_back"] forState:UIControlStateHighlighted];
        [tabBarItemBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_back_s"] forState:UIControlStateDisabled];
        [tabBarItemBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        [tabBarItemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tabBarItemBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [customTabBar addSubview:tabBarItemBtn];
        
        if (i == defaultIndex)
        {
            tabBarItemBtn.enabled = NO;
        }
    }
    
}

- (void)btnAction:(UIButton *)sender{

    NSInteger index = sender.tag - kBaseTag;
    sender.enabled = NO;
    
    UIButton *lastBtn = (UIButton *)[customTabBar viewWithTag:kBaseTag + self.selectedIndex];
    lastBtn.enabled = YES;
    
    //动画
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    _selectedImgView.frame = CGRectMake(_tabBarItemBtnW*index, 0, _tabBarItemBtnW, 49-20);
    [UIView commitAnimations];
    
    // 切换控制器视图
    self.selectedIndex = index;
    
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
