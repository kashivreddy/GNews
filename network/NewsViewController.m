//
//  NewsViewController.m
//  network
//
//  Created by Kashi Reddy on 15/03/14.
//  Copyright (c) 2014 TW. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsFeed.h"

@interface NewsViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *newsWebView;

@end

@implementation NewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[self.feed url]];
    [self setTitle:[self.feed title]];
    [self.newsWebView loadRequest:request];
    [self.newsWebView setDelegate:self];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

@end
