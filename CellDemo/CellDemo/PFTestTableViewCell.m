//
//  PFTestTableViewCell.m
//  CellDemo
//
//  Created by GPENGF on 14-7-16.
//  Copyright (c) 2014年 Sylar. All rights reserved.
//

#import "PFTestTableViewCell.h"

@implementation PFTestTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self addContent];
    }
    return self;
}

- (void)addContent{
    _showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *img1 = [UIImage imageNamed:@"1"];
    [_showBtn setImage:img1 forState:UIControlStateNormal];
    _showBtn.frame = CGRectMake(200, 5, 40, 40);
    [_showBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_showBtn];
    
    _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 30)];
    _showLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_showLabel];
    
}


- (void)btnClick:(UIButton*)btn{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"message" message:@"testinfo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        UIImage *img2 = [UIImage imageNamed:@"2"];
        [_showBtn setImage:img2 forState:UIControlStateNormal];
        NSLog(@"download start");
    }
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
