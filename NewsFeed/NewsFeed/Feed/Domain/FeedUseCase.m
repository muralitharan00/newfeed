//
//  FeedUseCase.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedModel.h"
#import "FeedRepository.h"
#import "FeedUseCase.h"

@implementation FeedUseCase

- (instancetype)initWithFeedRepository:(id<FeedRepositoryProtocol>)feedRepository {
    self = [super init];
       if (self) {
           _feedRepository = feedRepository;
       }
       return self;
}

- (instancetype)init {
    return [self initWithFeedRepository: [[FeedRepository alloc] init]];
}

- (NSArray<FeedModel *> *)getFeedsWithError:(NSError **)error {
    return [self.feedRepository fetchFeedsWithError: error];
}

@end
