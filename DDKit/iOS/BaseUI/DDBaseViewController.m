//
//  DDBaseViewController.m
//  iMarboo
//
//  Created by amoblin on 15/11/24.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "DDBaseViewController.h"
#import "DDMacros.h"

@interface DDBaseViewController ()

@end

@implementation DDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if (IOS_7_OR_LATER) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;        
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
    [self setupSubviews];
    [self configConstraints];
//    [self.navigationItem.backBarButtonItem setAction:@selector(backButtonPressedAction:)];
}

- (void)setupSubviews;
{
    // do nothing
}

- (void)configConstraints;
{
    // do nothing
}

/*
 // plan 1
- (void)backButtonPressedAction:(UIBarButtonItem *)sender;
{
    [self.navigationController popViewControllerAnimated:YES];
    if (self.popupSelfBlock) self.popupSelfBlock();
}
 */

// plan 2
/*
-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // Navigation button was pressed. Do some stuff
        [self.navigationController popViewControllerAnimated:YES];
        if (self.popupSelfBlock) self.popupSelfBlock();
    }
    [super viewWillDisappear:animated];
}
 */

// plan 3
-(void) viewDidDisappear:(BOOL)animated {
    if (self.navigationController == nil) {
        // Navigation button was pressed. Do some stuff
        if (self.popupSelfBlock) self.popupSelfBlock();
    }
    [super viewDidDisappear:animated];
}

- (void)rightButtonPressed:(UIBarButtonItem *)sender;
{
    // do nothing
}

- (void)leftButtonPressed:(UIBarButtonItem *)sender;
{
    // do nothing
}

@end
