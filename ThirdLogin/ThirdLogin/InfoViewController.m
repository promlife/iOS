//
//  InfoViewController.m
//  ThirdLogin
//
//  Created by GPENGF on 14-10-15.
//  Copyright (c) 2014年 PF. All rights reserved.
//

#import "InfoViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [btn setTitle:@"logout" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor yellowColor]];
    btn.center = [UIApplication sharedApplication].keyWindow.center;
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)logout:(id)sender{
    [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
    [self.navigationController popViewControllerAnimated:NO];
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
