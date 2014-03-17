//
//  NewsViewController.h
//  network
//
//  Created by Kashi Reddy on 15/03/14.
//  Copyright (c) 2014 TW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsFeed.h"

@interface NewsViewController : UIViewController<UIWebViewDelegate>

@property NewsFeed *feed;

@end
