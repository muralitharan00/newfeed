//
//  MockFeedUseCase.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//

#import <Foundation/Foundation.h>
#import "MockFeedUseCase.h"

@implementation MockFeedUseCase

- (NSArray<FeedModel *> *)getFeedsWithError:(NSError **)error {
    if (error != nil) {
           *error = self.mockError;
       }
       return self.mockFeeds;
}

@end
