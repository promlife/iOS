//
//  ViewController.m
//  ThirdLogin
//
//  Created by GPENGF on 14-10-15.
//  Copyright (c) 2014年 PF. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <Parse/Parse.h>
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [btn setTitle:@"login" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor yellowColor]];
    btn.center = [UIApplication sharedApplication].keyWindow.center;
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)login:(id)sender{
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> errorInfo){
        if (result) {
            PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
            [query whereKey:@"uid" equalTo:[userInfo uid]];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
                if (objects.count == 0) {
                    PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                    [newUser setObject:[userInfo uid] forKey:@"uid"];
                    [newUser setObject:[userInfo nickname] forKey:@"name"];
                    [newUser setObject:[userInfo profileImage] forKey:@"icon"];
                    [newUser saveInBackground];
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎你！" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
                    [alert show];
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎回来！" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
                    [alert show];
                }
                NSLog(@"info : %@ %@ %@ %@", [userInfo uid], [userInfo nickname], [userInfo profileImage], [userInfo aboutMe]);
                InfoViewController *ivc = [[InfoViewController alloc] init];
                [self.navigationController pushViewController:ivc animated:YES];
            }];
        }
        else{
            NSLog(@"error %@", errorInfo);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
