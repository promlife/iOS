//
//  PFTestTableViewController.m
//  CellDemo
//
//  Created by GPENGF on 14-7-16.
//  Copyright (c) 2014年 Sylar. All rights reserved.
//

#import "PFTestTableViewController.h"
#import "PFTestTableViewCell.h"

@interface PFTestTableViewController ()

@end

@implementation PFTestTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (sec[section]) {
        return 6;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *name = @"test";
    PFTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell = [[PFTestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:name];
    }
    cell.showLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row % 2];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:[NSString stringWithFormat:@"test %d", section] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 100, 30);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = section;
    return btn;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (void)btnClick:(UIButton*)sender{
    sec[sender.tag] = !sec[sender.tag];
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:sender.tag];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}



@end
