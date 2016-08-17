//
//  ViewController.m
//  DDKitDemo
//
//  Created by amoblin on 16/8/17.
//  Copyright © 2016年 marboo.io. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation ViewController

- (void)setupSubviews;
{
//    UILabel *label = [UILabel labelWithFont:DDSystemFontSize14 textColor:[UIColor colorWithHex:0xFA8910]];
    UILabel *label = [UILabel labelWithFont:DDSystemFontSize32 textColor:[UIColor colorWithHexString:@"#FA8910"]];
    [self.view addSubview:label];
    self.infoLabel = label;
}

- (void)configConstraints;
{
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@100);
    }];
}

- (void)reloadData;
{
    self.infoLabel.text = @"Hello, DDUIKit!";
}

@end
