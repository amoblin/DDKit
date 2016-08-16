//
//  DDBaseView.m
//  DDBrickDemo
//
//  Created by amoblin on 16/4/28.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "DDBaseView.h"

@implementation DDBaseView

- (instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
        [self configConstraints];
    }
    return self;
}

- (void)setupSubviews;
{
    // override for setup subviews
}

- (void)configConstraints;
{
    // override for config constraints
}

@end
