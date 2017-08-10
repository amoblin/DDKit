//
//  ViewController.m
//  DDKitDemo
//
//  Created by amoblin on 16/8/17.
//  Copyright © 2016年 marboo.io. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIView *animatedView;

@end

@implementation ViewController

- (void)setupSubviews;
{
    [super setupSubviews];
//    UILabel *label = [UILabel labelWithFont:DDSystemFontSize14 textColor:[UIColor colorWithHex:0xFA8910]];
    UILabel *label = [UILabel labelWithFont:DDSystemFontSize32 textColor:[UIColor colorWithHexString:@"#FA8910"]];
    [self.view addSubview:label];
    self.infoLabel = label;
    
    UIImageView *v = [[UIImageView alloc] init];
    v.image = [UIImage imageNamed:@"demo"];
    [self.view addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-10);
        make.left.equalTo(@150);
        make.size.mas_equalTo(CGSizeMake(0, 0));
    }];
    self.animatedView = v;
}

- (void)viewDidAppear:(BOOL)animated;
{
    sleep(2);
    [UIView animateWithDuration:10.0 animations:^{
        CGRect frame = self.animatedView.frame;
        frame.origin.y = self.view.frame.size.height - 10 - 150*1.1;
        frame.origin.x = 150 - 0.7 * 1.1 * 200;
        frame.size = CGSizeMake(200 * 1.1, 150 * 1.1);
        self.animatedView.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.animatedView.frame;
            frame.origin.y = self.view.frame.size.height - 10 - 150;
            frame.origin.x = 150 - 0.7 * 200;
            frame.size = CGSizeMake(200, 150);
            self.animatedView.frame = frame;
        }];
    }];
}

- (void)configConstraints;
{
    [super configConstraints];
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
