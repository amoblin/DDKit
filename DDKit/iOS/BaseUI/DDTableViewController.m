//
//  DDTableViewController.m
//  Pods
//
//  Created by amoblin on 16/8/28.
//
//

#import "DDTableViewController.h"
#import "DDTableViewCell.h"
#import "Masonry.h"

#define DEMO_COUNT 3
#define DEMO_ID @"cellId"
#define DEMO_HEIGHT 60

@interface DDTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DDTableViewController

- (void)setupSubviews;
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view insertSubview:self.tableView atIndex:0];
    [self setupRefreshControl];
}

- (void)configConstraints;
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)setupRefreshControl;
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshTableView:) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshTableView:(UIRefreshControl *)sender;
{
    [self.refreshControl endRefreshing];
    [self reloadData];
}

- (void)reloadData;
{
    [super reloadData];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return DEMO_COUNT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = DEMO_ID;
    [tableView registerClass:[DDTableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    DDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return DEMO_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - UITableView Edit

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}


@end
