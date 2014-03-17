//
// Created by Kashi Reddy on 15/03/14.
// Copyright (c) 2014 TW. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsFeed : NSObject

@property NSURL *url;
@property NSString * content;
@property NSString *title;

//- (instancetype)initWithUrl:(NSURL *)url content:(NSString *)content title:(NSString *)title;

+ (instancetype)feedWithUrl:(NSURL *)url content:(NSString *)content title:(NSString *)title;

@end