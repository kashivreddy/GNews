//
//  KRViewController.m
//  network
//
//  Created by Kashi Reddy on 15/03/14.
//  Copyright (c) 2014 TW. All rights reserved.
//

#import "KRViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "NSArray+ObjectiveSugar.h"
#import "NewsFeed.h"
#import "NewsViewController.h"
#import "NewsItemCell.h"

@interface KRViewController ()

@property NSMutableArray * feeds;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation KRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    self.feeds = [NSMutableArray new];

    [manager GET:@"http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *entries = responseObject[@"responseData"][@"feed"][@"entries"];

        [entries each:^(NSDictionary *object) {
            NSURL *url = [NSURL URLWithString:object[@"link"]];
            NewsFeed *feed = [NewsFeed feedWithUrl:url content:object[@"contentSnippet"] title:object[@"title"]];
            [self.feeds addObject:feed];
        }];

        [self.tableView reloadData];
        [self.activityIndicator stopAnimating];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NewsFeed *feed = [self.feeds objectAtIndex:indexPath.row];
    
    [cell.titleLabel setText:feed.title];
    [cell.snippet setText:feed.content];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *cell = (UITableViewCell *) sender;
    int index = [[self.tableView indexPathForCell:cell] row];

    NewsViewController *controller = (NewsViewController *)[segue destinationViewController];
    [controller setFeed:self.feeds[index]];
}
@end