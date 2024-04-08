//
//  MockDataHandler.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "FeedDataHandler.h"
#import "MockDataHandler.h"

@implementation MockDataHandler

- (NSArray<FeedResponseModel *> *)fetchFeedsWithError:(NSError **)error {
    if (error != nil) {
        *error = self.mockError;
    }
    return self.mockFeeds;
}

@end
