//
//  DDBaseViewController.h
//  iMarboo
//
//  Created by amoblin on 15/11/24.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDBaseViewController : UIViewController

@property (nonatomic, copy) void (^popupSelfBlock)();

- (void)leftButtonPressed:(UIBarButtonItem *)sender;

- (void)rightButtonPressed:(UIBarButtonItem *)sender;

- (void)setupSubviews;
- (void)configConstraints;

@end
