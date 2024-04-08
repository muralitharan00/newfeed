//
//  FeedResponseModel.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"

@implementation FeedResponseModel

- (instancetype)initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    if (self) {
        self.publishedAt = dictionary[@"publishedAt"];
        self.title = dictionary[@"title"];
        self.url = dictionary[@"url"];
        self.urlToImage = dictionary[@"urlToImage"];
    }
    return self;
}

@end
