//
//  MockFeedInteractor.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 05/04/24.
//

#import <Foundation/Foundation.h>
#import "MockFeedInteractor.h"
#import "FeedPresentationModel.h"

@implementation MockFeedInteractor

- (NSArray<FeedPresentationModel *> *)getFeedsWithError:(NSError **)error {
    if (error != nil) {
        *error = self.mockError;
    }
    return self.mockFeeds;
}

@end
