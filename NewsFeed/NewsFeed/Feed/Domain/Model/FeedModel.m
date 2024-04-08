//
//  FeedModel.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedModel.h"

@implementation FeedModel

- (instancetype)initWith: (NSString *)publishedAt
                   title: (NSString *)title
                     url: (NSString *)url
              urlToImage: (NSString *)urlToImage {
    self = [super init];
    if (self) {
        self.publishedAt = [publishedAt copy];
        self.title = [title copy];
        self.url = [url copy];
        self.urlToImage = [urlToImage copy];
    }
    return self;
}

@end
