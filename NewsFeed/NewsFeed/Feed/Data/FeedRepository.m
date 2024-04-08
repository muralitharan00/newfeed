//
//  FeedRepository.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "FeedRepository.h"
#import "FeedDataHandler.h"
#import "FeedModel.h"
#import "FeedMapper.h"

NSString * const FeedRepositoryErrorDomain = @"com.aciworldwide.FeedRepositoryErrorDomain";
NSString * const FeedRepositoryErrorDataFetchingFailedDescription = @"Failed to fetch feeds.";

@implementation FeedRepository

- (instancetype)initWithDataHandler:(id<FeedDataHandlerProtocol>)dataHandler {
    self = [super init];
       if (self) {
           _dataHandler = dataHandler;
       }
       return self;
}

- (instancetype)init {
    return [self initWithDataHandler: [[FeedDataHandler alloc] init]];
}

- (NSArray<FeedModel *> *)fetchFeedsWithError:(NSError **)error {
    NSArray<FeedResponseModel *> *feedResponseModels = [self.dataHandler fetchFeedsWithError: error];
    if (!feedResponseModels && error && *error) {
        *error = [NSError errorWithDomain: FeedRepositoryErrorDomain
                                     code: FeedRepositoryErrorDataFetchingFailed
                                 userInfo: @{ NSLocalizedDescriptionKey: FeedRepositoryErrorDataFetchingFailedDescription }];
    }
    
    NSMutableArray<FeedModel *> *feeds = [NSMutableArray array];
    for (FeedResponseModel *responseModel in feedResponseModels) {
        FeedModel *model = [FeedMapper dataModelFromArticle: responseModel];
        [feeds addObject: model];
    }
    return feeds;
}

@end
