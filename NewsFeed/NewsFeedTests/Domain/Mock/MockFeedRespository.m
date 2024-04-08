//
//  MockFeedRespository.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//

#import <Foundation/Foundation.h>
#import "FeedRepository.h"
#import "MockFeedRepository.h"

@implementation MockFeedRepository

- (NSArray<FeedModel *> *)fetchFeedsWithError:(NSError **)error {
    if (error != nil) {
        *error = self.mockError;
    }
    return self.mockFeeds;
}

@end
