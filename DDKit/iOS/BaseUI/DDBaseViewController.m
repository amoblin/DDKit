//
//  DDBaseViewController.m
//  iMarboo
//
//  Created by amoblin on 15/11/24.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "DDBaseViewController.h"
#import "DDMacros.h"

@interface DDBaseViewController () <UINavigationBarDelegate>

@end

@implementation DDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    if (IOS_7_OR_LATER) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;        
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
    self.navigationItem.titleView = self.navTitleLabel;

    [self setupSubviews];
    [self configConstraints];
    [self resetData];
    [self setupModelArray];
    [self reloadData];
//    [self.navigationItem.backBarButtonItem setAction:@selector(backButtonPressedAction:)];
}

#pragma mark - DDUIKit Work Flow

- (void)resetData;
{
    // should be implemented by subclass
}

- (void)setupSubviews;
{
    // should be implemented by subclass
}

- (void)configConstraints;
{
    // should be implemented by subclass
}

- (void)setupModelArray;
{
    // should be implemented by subclass
}

- (void)reloadData;
{
    // should be implemented by subclass
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
    NSLog(@"right button pressed");
}

- (void)leftButtonPressed:(UIBarButtonItem *)sender;
{
    // do nothing
}

- (void)addTopToolbar;
{
    UINavigationBar *bar;
    if (IOS_7_OR_LATER) {
        bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    } else {
        bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    }
//    bar.backgroundColor = UIColorFromRGB(122.0, 122.0, 122.0);
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:Local(@"Title")];
    self.navItem = item;
    [bar setItems:@[item]];
    item.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Local(@"Close")
                                                               style:UIBarButtonItemStyleDone
                                                              target:self
                                                              action:@selector(close:)];
    [bar setDelegate:self];
    self.navBar = bar;
    [self.view addSubview:bar];

//    CGFloat height = self.view.frame.size.height - 44 - 64;
//    self.mTableView.frame = CGRectMake(0, 64, self.view.frame.size.width, height);
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar;
{
    return UIBarPositionTopAttached;
}

- (void)close:(UINavigationItem *)sender;
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
