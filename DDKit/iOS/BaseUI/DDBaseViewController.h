//
//  DDBaseViewController.h
//  iMarboo
//
//  Created by amoblin on 15/11/24.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "DDFonts.h"
#import "UILabel+DD.h"
#import "UIColor+DD.h"


@interface DDBaseViewController : UIViewController

@property (nonatomic, copy) void (^popupSelfBlock)();
@property (nonatomic, strong) UILabel *navTitleLabel;

- (void)leftButtonPressed:(UIBarButtonItem *)sender;

- (void)rightButtonPressed:(UIBarButtonItem *)sender;

- (void)setupSubviews;

- (void)configConstraints;

- (void)reloadData;

@end
