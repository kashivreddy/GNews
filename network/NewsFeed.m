//
// Created by Kashi Reddy on 15/03/14.
// Copyright (c) 2014 TW. All rights reserved.
//

#import "NewsFeed.h"


@implementation NewsFeed {

}

- (instancetype)initWithUrl:(NSURL *)url content:(NSString *)content title:(NSString *)title {
    self = [super init];
    if (self) {
        self.url = url;
        self.content = content;
        self.title = title;
    }

    return self;
}

+ (instancetype)feedWithUrl:(NSURL *)url content:(NSString *)content title:(NSString *)title {
    return [[self alloc] initWithUrl:url content:content title:title];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"title: %@", self.title];

    return description;
}

@end