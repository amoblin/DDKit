//
//  UILabel+DD.m
//  iMarboo
//
//  Created by amoblin on 15/11/20.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "UILabel+DD.h"

@implementation UILabel (DD)

+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor;
{
    UILabel *label = [UILabel new];
    label.font = font;
    label.textColor = textColor;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    return label;
}

- (void)setFont:(UIFont *)font andTextColor:(UIColor *)textColor;
{
    self.font = font;
    self.textColor = textColor;
}

@end
