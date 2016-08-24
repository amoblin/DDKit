//
//  DDCollectionViewCell.m
//  Pods
//
//  Created by amoblin on 16/8/25.
//
//

#import "DDCollectionViewCell.h"

@implementation DDCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
        [self configConstraints];
//        self.layer.borderWidth = 0.5;
//        self.layer.borderColor = DDHexColor666666.CGColor;
    }
    return self;
}

- (void)setupSubviews;
{
}

- (void)configConstraints;
{
}

- (void)configCell;
{
}

@end
